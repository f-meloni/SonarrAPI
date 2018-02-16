//
//  TestResult.swift
//  SonarrAPITests
//
//  Created by Franco Meloni on 07/02/2018.
//

struct TestResult: Codable {
    var test: Bool
    
    static func testResponse() -> AnyObject {
        return ["test": true] as AnyObject
    }
}
