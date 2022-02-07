//
//  RatesServiceManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

class RatesAPI {
    var APIManager: ApiManager
    
    init(APIManager: ApiManager) {
        self.APIManager = APIManager
    }
    
    func fetchAllRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        APIManager.fetchAll { result in
            ///
        }
    }
    
}


class RatesAPIMock: RatesAPI {
    override func fetchAllRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        completion(Result.success([Rate(code: "USD", value: 200),
                                   Rate(code: "COP", value: 1000),
                                   Rate(code: "EUR", value: 200)]))
    }
}
