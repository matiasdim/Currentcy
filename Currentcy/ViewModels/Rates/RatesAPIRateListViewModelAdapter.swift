//
//  RatesAPIRateListViewModelAdapter.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import Foundation

/// Adapter to avoid coupling higher level module (The Rates API) to a lower level component (RatesListViewModel throught RatesService implementation)
class RatesAPIRateListViewModelAdapter: RatesService {
    let api: RatesAPI
    
    init(api: RatesAPI) {
        self.api = api
    }
    
    func loadRates(baseRate: String,completion: @escaping (Result<[Rate], Error>) -> Void) {
        api.fetchAllRates(baseRate: baseRate) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
