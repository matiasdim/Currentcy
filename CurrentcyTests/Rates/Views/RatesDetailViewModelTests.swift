//
//  RatesDetailViewModel.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//

import XCTest

class RatesDetailViewModel: XCTestCase {

    func testInit() {
        let rate = Rate(code: "COP", value: 100)
        let sut = RateDetailViewModel(rate: rate)
        
        XCTAssertNotNil(sut.rate)
    }
    
    func testCodeAttribute() {
        let rate = Rate(code: "COP", value: 100)
        let sut = RateDetailViewModel(rate: rate)
        
        XCTAssertEqual(sut.code, "COP")
    }
    
    func testValueAttribute() {
        let rate = Rate(code: "COP", value: 100.0)
        let sut = RateDetailViewModel(rate: rate)
        
        XCTAssertEqual(sut.value, String(100.0))
    }

}
