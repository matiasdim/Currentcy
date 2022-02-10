//
//  Rate.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

struct Rate: Codable, Equatable {
    let code: String
    let value: Double
}

struct RatesResponse: Codable {
    let data: [String: Double]
}
