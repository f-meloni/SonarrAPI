//
//  Serie.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation
public struct Series : Codable {
	public let title : String?
	public let alternateTitles : [AlternateTitle]?
	public let sortTitle : String?
	public let seasonCount : Int?
	public let totalEpisodeCount : Int?
	public let episodeCount : Int?
	public let episodeFileCount : Int?
	public let sizeOnDisk : Int?
	public let status : String?
	public let overview : String?
	public let previousAiring : String?
	public let network : String?
	public let airTime : String?
	public let images : [Image]?
	public let seasons : [Season]?
	public let year : Int?
	public let path : String?
	public let profileId : Int?
	public let seasonFolder : Bool?
	public let monitored : Bool?
	public let useSceneNumbering : Bool?
	public let runtime : Int?
	public let tvdbId : Int?
	public let tvRageId : Int?
	public let tvMazeId : Int?
	public let firstAired : String?
	public let lastInfoSync : String?
	public let seriesType : String?
	public let cleanTitle : String?
	public let imdbId : String?
	public let titleSlug : String?
	public let certification : String?
	public let genres : [String]?
	public let tags : [String]?
	public let added : String?
	public let ratings : Ratings?
	public let qualityProfileId : Int?
	public let id : Int?

	enum CodingKeys: String, CodingKey {
		case title = "title"
		case alternateTitles = "alternateTitles"
		case sortTitle = "sortTitle"
		case seasonCount = "seasonCount"
		case totalEpisodeCount = "totalEpisodeCount"
		case episodeCount = "episodeCount"
		case episodeFileCount = "episodeFileCount"
		case sizeOnDisk = "sizeOnDisk"
		case status = "status"
		case overview = "overview"
		case previousAiring = "previousAiring"
		case network = "network"
		case airTime = "airTime"
		case images = "images"
		case seasons = "seasons"
		case year = "year"
		case path = "path"
		case profileId = "profileId"
		case seasonFolder = "seasonFolder"
		case monitored = "monitored"
		case useSceneNumbering = "useSceneNumbering"
		case runtime = "runtime"
		case tvdbId = "tvdbId"
		case tvRageId = "tvRageId"
		case tvMazeId = "tvMazeId"
		case firstAired = "firstAired"
		case lastInfoSync = "lastInfoSync"
		case seriesType = "seriesType"
		case cleanTitle = "cleanTitle"
		case imdbId = "imdbId"
		case titleSlug = "titleSlug"
		case certification = "certification"
		case genres = "genres"
		case tags = "tags"
		case added = "added"
		case ratings
		case qualityProfileId = "qualityProfileId"
		case id = "id"
	}
}
