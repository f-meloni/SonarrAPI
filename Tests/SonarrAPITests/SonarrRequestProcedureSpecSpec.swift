//
//  SonarrRequestSpec.swift
//  SonarrAPITests
//
//  Created by Franco Meloni on 07/02/2018.
//

import Quick
import Nimble
import ProcedureKit

@testable import SonarrAPI

final class SonarrRequestProcedureSpec: QuickSpec {
    override func spec() {
        var sonarrRequest: TestRequest!
        var requestProcedure: SonarrRequestProcedure<TestResult>!
        var queue: ProcedureQueue!
        
        let host = "test.it"
        let port = "8080"
        let apiKey = "testApiKey"
        var url: String!
        
        var params: [String:String]?
        
        describe("Sonarr Request") {
            beforeEach {
                queue = ProcedureQueue()
                sonarrRequest = TestRequest(completionBlock: { (_) in })
                requestProcedure = SonarrRequestProcedure(host: host, port: port, apiKey: apiKey, request: sonarrRequest)
                queue.add(operation: requestProcedure)
            }
            
            context("When the request is executed", closure: {
                beforeEach {
                    
                }
                
                it("contains the correct apiKey in the parameters", closure: {
                    expect(params?["apiKey"]).toEventually(equal(apiKey))
                })
            })
        }
    }
}

fileprivate final class TestRequest: SonarrRequest<TestResult> {
    override var endpoint: SonarrAPIEndpoint {
        return SonarrAPIEndpoint(path: "test", method: .get)
    }
}
