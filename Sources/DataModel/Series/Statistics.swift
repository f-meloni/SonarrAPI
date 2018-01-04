//
//  Statistics.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation
public struct Statistics : Codable {
	public let previousAiring : String?
	public let episodeFileCount : Int?
	public let episodeCount : Int?
	public let totalEpisodeCount : Int?
	public let sizeOnDisk : Int?
	public let percentOfEpisodes : Int?

	enum CodingKeys: String, CodingKey {
		case previousAiring = "previousAiring"
		case episodeFileCount = "episodeFileCount"
		case episodeCount = "episodeCount"
		case totalEpisodeCount = "totalEpisodeCount"
		case sizeOnDisk = "sizeOnDisk"
		case percentOfEpisodes = "percentOfEpisodes"
	}
}
