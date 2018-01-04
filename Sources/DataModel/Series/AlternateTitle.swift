//
//  AlternateTitle.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation

public struct AlternateTitle : Codable {
	public let title : String?
	public let seasonNumber : Int?

	enum CodingKeys: String, CodingKey {
		case title = "title"
		case seasonNumber = "seasonNumber"
	}
}
