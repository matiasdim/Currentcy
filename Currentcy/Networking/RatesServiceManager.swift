//
//  RatesServiceManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

struct RatesServiceManager: RatesService {
    var api: ApiManager
    
    func loadRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        /// set api.urlBuilder components for this call first
        
    }
}


struct RatesServiceManagerMock: RatesService {
    
    func loadRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        completion(Result.success([Rate(code: "USD", value: 200),
                                   Rate(code: "COP", value: 1000),
                                   Rate(code: "EUR", value: 200)]))
    }
}
