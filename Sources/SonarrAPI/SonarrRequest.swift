//
//  SonarrRequest.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import ProcedureKit

public class SonarrRequest<T: Codable> {
    var endpoint: SonarrAPIEndpoint {
        get {
            fatalError("please override the endpoint variable on the SonarrRequest subclass")
        }
    }
    
    let completionBlock: (ProcedureResult<T>) -> Void
    
    init(completionBlock: @escaping (ProcedureResult<T>) -> Void) {
        self.completionBlock = completionBlock
    }

    public func handleResponse(_ response: ProcedureResult<T>) {
        self.completionBlock(response)
    }
}
