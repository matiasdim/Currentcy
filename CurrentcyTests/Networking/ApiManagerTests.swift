//
//  ApiManagerTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import XCTest

class ApiManagerTests: XCTestCase {

    func testCorrectInit() {
        let sut = setSut()
        
        XCTAssertNotNil(sut.session)
        XCTAssertNotNil(sut.urlBuilder)
        XCTAssertNotNil(sut.errormanager)
    }
    
    func testNetworkmanagerProtocolConformance() {
        let sut = setSut()
        
        XCTAssertTrue(isNetworkManager(element: sut))
    }
    
    
    private func isNetworkManager<T>(element: T) -> Bool {
        if let _ = element as? NetworkManager {
            return true
        } else {
            return false
        }
    }
    
    private func setSut() -> ApiManager {
        var urlBuilder = URLBuilder(builder: URLComponents())
        urlBuilder.scheme = "https"
        urlBuilder.host = "google.com"
        return ApiManager(session: .shared, urlBuilder: urlBuilder, errormanager: ErrorManager())
    }

}
