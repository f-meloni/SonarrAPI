//
//  Season.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation

public struct Season: Codable {
	public let seasonNumber : Int?
	public let monitored : Bool?
	public let statistics : Statistics?

	enum CodingKeys: String, CodingKey {
		case seasonNumber = "seasonNumber"
		case monitored = "monitored"
		case statistics
	}
}
