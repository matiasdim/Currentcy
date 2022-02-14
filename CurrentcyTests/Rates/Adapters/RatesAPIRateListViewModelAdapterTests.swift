//
//  RatesAPIRateListViewModelAdapterTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import XCTest

class RatesAPIRateListViewModelAdapterTests: XCTestCase {

    func testInit() {
        let apiManager = ApiManager(session: .shared, errormanager: ErrorManager())
        let api = RatesAPI(APIManager: apiManager)
        let sut = RatesAPIRateListViewModelAdapter(api: api)
        
        XCTAssertNotNil(sut.api)
    }
    
    func testRatesServiceProtocolConformance() {
        let apiManager = ApiManager(session: .shared, errormanager: ErrorManager())
        let api = RatesAPI(APIManager: apiManager)
        let sut = RatesAPIRateListViewModelAdapter(api: api)
        
        XCTAssertTrue(isRateService(element: sut))
    }
    
    
    private func isRateService<T>(element: T) -> Bool {
        if let _ = element as? RatesService {
            return true
        } else {
            return false
        }
    }
}

