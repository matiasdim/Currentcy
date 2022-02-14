//
//  ErrorManagerTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import XCTest

class ErrorManagerTests: XCTestCase {

    func testErrorManagerDefaultError() {
        let sut = ErrorManager()
        
        XCTAssertEqual(sut.defaultError.localizedDescription, AppLocalization.GenericKeys.errorGenericMessage.localizedString)
    }
    
    func testErrorManagerURLError() {
        let sut = ErrorManager()
        
        XCTAssertEqual(sut.urlError.localizedDescription, AppLocalization.GenericKeys.urlErrorMessage.localizedString)
    }

}
