//
//  EndpointParametersConvertible.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 01/02/2018.
//

protocol EndpointParametersConvertible {
    var pathParameters: [String:String] { get }
}
