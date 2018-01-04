//
//  Ratings.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation

public struct Ratings: Codable {
	public let votes: Int?
	public let value: Double?

	enum CodingKeys: String, CodingKey {
		case votes = "votes"
		case value = "value"
	}
}
