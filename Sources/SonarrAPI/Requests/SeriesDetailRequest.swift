//
//  SeriesDetailRequest.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 01/02/2018.
//
import ProcedureKit

public class SeriesDetailRequest: SonarrRequest<Series>, EndpointParametersConvertible {
    override var endpoint: SonarrAPIEndpoint {
        get {
            return SonarrAPIEndpoint(path: "series/:id", method: .get)
        }
    }
    
    let id: Int
    var pathParameters: [String : String] {
        return ["id": String(describing: id)]
    }
    
    public init(seriesID: Int, completionBlock: @escaping (ProcedureResult<Series>) -> Void) {
        self.id = seriesID
        super.init(completionBlock: completionBlock)
    }
}
