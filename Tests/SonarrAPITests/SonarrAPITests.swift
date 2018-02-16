import XCTest
import Quick
import Nimble
@testable import SonarrAPI

final class SonarrAPISpec: QuickSpec {
    override func spec() {
        var sonarrAPI: SonarrAPI!
        let testHost = "host"
        let testPort = "port"
        let testApiKey = "apiKey"
        
        beforeEach {
            sonarrAPI = SonarrAPI(host: testHost, port: testPort, apiKey: testApiKey)
        }
        
        describe("SonarrAPI") {
            context("When execute method is called") {
                beforeEach {
                    sonarrAPI.queue.isSuspended = true
                    sonarrAPI.execute(request: TestSonarrRequest(completionBlock: { (_) in }))
                }
                
                it("adds only the correct SonarrRequestProcedure to the queue", closure: {
                    expect(sonarrAPI.queue.operations.count) == 1
                    expect(sonarrAPI.queue.operations[0]).to(beAnInstanceOf(SonarrRequestProcedure<TestResult>.self))
                })
                
                it("adds a SonarrRequestProcedure with correct data", closure: {
                    let procedure = sonarrAPI.queue.operations.first as! SonarrRequestProcedure<TestResult>
                    
                    expect(procedure.host) == testHost
                    expect(procedure.port) == testPort
                    expect(procedure.apiKey) == testApiKey
                })
            }
        }
    }
}

private final class TestSonarrRequest: SonarrRequest<TestResult> {
}
