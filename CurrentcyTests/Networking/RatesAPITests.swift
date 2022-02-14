//
//  RatesAPITests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import XCTest

class RatesAPITests: XCTestCase {

    func testCorrectInit() {
        let apiManager = ApiManager(session: .shared, errormanager: ErrorManager())
        let sut = RatesAPI(APIManager: apiManager)
        
        XCTAssertNotNil(sut.apiManager)
    }
    
    func testURLConstants() {
        let ratesAPIScheme = "https"
        let ratesAPIHost = "freecurrencyapi.net"
        let ratesAPIPort = 80
        let ratesAPIPath = "/api/v2/latest"
        let ratesAPIQuery = "apikey=1a7ff870-88e3-11ec-9880-db412896d8a5"
        
        XCTAssertEqual(ratesAPIScheme, "https")
        XCTAssertEqual(ratesAPIHost, "freecurrencyapi.net")
        XCTAssertEqual(ratesAPIPort, 80)
        XCTAssertEqual(ratesAPIPath, "/api/v2/latest")
        XCTAssertEqual(ratesAPIQuery, "apikey=1a7ff870-88e3-11ec-9880-db412896d8a5")
    }
    
    func testFetchAllRequest() {
        let apiManager = ApiManager(session: .shared, errormanager: ErrorManager())
        let sut = RatesAPI(APIManager: apiManager)
        
        let expectation = expectation(description: "fetchCallFullfilled")
        
        sut.fetchAllRates(baseRate: "USD") { response in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }

}
