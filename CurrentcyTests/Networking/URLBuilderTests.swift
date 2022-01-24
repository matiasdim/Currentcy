//
//  URLBuilderTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//

import XCTest

class URLBuilderTests: XCTestCase {

    func testURLBuilder() {
        var sut = URLBuilder(builder: URLComponents())
        sut.scheme = "https"
        sut.host = "google.com"
        sut.port = 4040
        sut.query = "name=me"
        sut.path = "/v1"
        
        XCTAssertEqual(URL(string: "https://google.com:4040/v1?name=me"), sut.url)
    }

}
