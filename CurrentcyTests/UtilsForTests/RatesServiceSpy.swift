//
//  RatesServiceSpy.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//


class RatesServiceSpy: RatesService {
    private(set) var loadRatesCount = 0
    private let result: Result<[Rate], Error>
    
    init(result: Result<[Rate], Error> = .success([])) {
        self.result = result
    }
    
    func loadRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        loadRatesCount += 1
        completion(result)
    }
}
