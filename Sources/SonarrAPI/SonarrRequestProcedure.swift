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
    
    private let host: String
    private let apiKey: String
    private let request: SonarrRequest<T>
    
    var output: Pending<ProcedureResult<T>>
    
    private lazy var manager: SessionManager = {
        return .default
    }()
    
    init(host: String, apiKey: String, request: SonarrRequest<T>) {
        self.host = host
        self.apiKey = apiKey
        self.request = request
        self.output = .pending
        
        super.init()
    }
    
    override func execute() {
        let parameters = ["apiKey": self.apiKey]
        manager.request(host + request.endpoint.path, method: request.endpoint.method, parameters: parameters).validate().responseData { [weak self] (response) in
            
            switch(response.result) {
            case .success(let data):
                if let result = try? JSONDecoder().decode(T.self, from: data) {
                    self?.finish(withResult: .success(result))
                }
                else {
                    self?.finish(withError: SonarrRequestProcedureError.responseNotValid)
                }
            case .failure(let error):
                self?.finish(withResult: .failure(error))
            }
        }
    }
}
