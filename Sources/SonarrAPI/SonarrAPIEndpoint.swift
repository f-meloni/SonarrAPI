//
//  APIEndpoint.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation
import Alamofire

public struct SonarrAPIEndpoint {
    public let method: Alamofire.HTTPMethod
    public let path: String
    
    public init(path: String, method: Alamofire.HTTPMethod) {
        self.method = method
        self.path = path
    }
    
    public func pathWithParameters(_ parameters: [String:String]?) -> String {
        var pathWithParameters = self.path
        
        for (key, value) in parameters ?? [:] {
            pathWithParameters = pathWithParameters.replacingOccurrences(of: ":" + key, with: value)
        }
        
        return pathWithParameters
    }
}
