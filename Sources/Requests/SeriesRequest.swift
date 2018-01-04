//
//  SeriesRequest.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import ProcedureKit

public class SeriesRequest: SonarrRequest<[Series]> {
    public override var endpoint: SonarrAPIEndpoint {
        get {
            return SonarrAPIEndpoint(path: "series", method: .get)
        }
    }
}
