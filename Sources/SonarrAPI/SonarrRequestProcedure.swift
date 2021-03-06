//
//  SonarrRequestOperation.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import ProcedureKit
import Alamofire
import Foundation

enum SonarrRequestProcedureError: Error {
    case responseNotValid
}

class SonarrRequestProcedure<T: Codable>: Procedure, OutputProcedure {
    typealias Output = T
    
    let host: String
    let port: String
    let apiKey: String
    private let request: SonarrRequest<T>
    
    var output: Pending<ProcedureResult<T>>
    
    private lazy var manager: SessionManager = {
        return .default
    }()
    
    private var requestEndpointPath: String {
        if let request = request as? (EndpointParametersConvertible & SonarrRequest<T>) {
            return request.endpoint.pathWithParameters(request.pathParameters)
        }
        else {
            return request.endpoint.path
        }
    }
    
    init(host: String, port: String, apiKey: String, request: SonarrRequest<T>) {
        self.host = host
        self.port = port
        self.apiKey = apiKey
        self.request = request
        self.output = .pending
        
        super.init()
    }
    
    override func execute() {
        let parameters = ["apiKey": self.apiKey]
        let requestURL = "http://\(host):\(port)/api/\(requestEndpointPath)"
        
        print(requestURL)
        
        Alamofire.request(requestURL, method: request.endpoint.method, parameters: parameters, headers: ["Accept-Encoding": "application/json"]).validate().responseData(queue: DispatchQueue.default) { (response) in
            switch(response.result) {
            case .success(let data):
                if let result = try? JSONDecoder().decode(T.self, from: data) {
                    self.finish(withResult: .success(result))
                }
                else {
                    self.finish(withError: SonarrRequestProcedureError.responseNotValid)
                }
            case .failure(let error):
                print(error)
                self.finish(withResult: .failure(error))
            }
        }
    }
}
