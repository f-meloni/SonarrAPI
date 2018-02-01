//
//  SeriesDetailRequest.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 01/02/2018.
//
import ProcedureKit

class SeriesDetailRequest: SonarrRequest<Series>, EndpointParametersConvertible {
    override var endpoint: SonarrAPIEndpoint {
        get {
            return SonarrAPIEndpoint(path: "series/:id", method: .get)
        }
    }
    
    var id: Int
    
    var pathParameters: [String : String] {
        return ["id": String(describing: id)]
    }
    
    init(completionBlock: @escaping (ProcedureResult<Series>) -> Void, seriesID: Int) {
        self.id = seriesID
        super.init(completionBlock: completionBlock)
    }
}
