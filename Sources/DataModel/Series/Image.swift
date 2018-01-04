//
//  Image.swift
//  SonarrAPI
//
//  Created by Franco Meloni on 03/01/2018.
//

import Foundation

public struct Image : Codable {
	public let coverType : String
	public let url : String

	enum CodingKeys: String, CodingKey {
		case coverType = "coverType"
		case url = "url"
	}
}
