//
//  SonarrAPI.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import ProcedureKit

public struct SonarrAPI {
    private let host: String
    private let port: String
    private let apiKey: String
    private let queue: ProcedureQueue
    
    public init(host: String, port: String, apiKey: String) {
        self.host = host
        self.port = port
        self.apiKey = apiKey
        self.queue = ProcedureQueue()
    }
    
    public func execute<T>(request: SonarrRequest<T>) {
        let requestProcedure = SonarrRequestProcedure(host: host, port: port, apiKey: apiKey, request: request)
        
        requestProcedure.add(observer: WillFinishObserver(willFinish: { [weak requestProcedure] (_, _, _) in
            if let value = requestProcedure?.output.value {
                request.handleResponse(value)
            }
        }))
        
        queue.add(operation: requestProcedure)
    }
}
