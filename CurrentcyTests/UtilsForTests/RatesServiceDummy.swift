//
//  RatesServiceDummy.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//

class RatesServiceDummy: RatesService {
    func loadRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        // do nothing
    }
}
