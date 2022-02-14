//
//  RateTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import XCTest

class RateTests: XCTestCase {

    func testReate() {
        let rateCode = "COP"
        let rateValue = 200.2
        let sut = Rate(code: rateCode, value: rateValue)
        
        XCTAssertEqual(sut.code, rateCode)
        XCTAssertEqual(sut.value, rateValue)
    }

}
