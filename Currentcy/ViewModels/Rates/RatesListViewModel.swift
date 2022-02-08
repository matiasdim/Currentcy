//
//  RatesListViewModel.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

class RateListViewModel {
    
    init(rates: [Rate] = [], service: RatesService) {
        self.rates = rates
        self.service = service
    }
    
    var rates: [Rate] {
        didSet {
            reloadTable?()
        }
    }
    
    var service: RatesService
    
    var numbersOfSections: Int {
        return 1
    }
    
    var numbersOfRows: Int {
        return rates.count
    }
    
    /// ViewController bindings
    var reloadTable: (() -> Void)?
    var showError: ((_ error: Error) -> Void)?
    
    func loadRates() {
        service.loadRates(baseRate: "USD") { [weak self] result in
            switch result {
                case .success(let rates):
                    self?.rates = rates
                case .failure(let error):
                    self?.showError?(error)
            }
        }
    }
    
    func rate(at index: Int) -> RateDetailViewModel {
        return RateDetailViewModel(rate: rates[index])
    }
}

/// Adapter to avoid coupling higher level module (The Rates API) to a lower level component (RatesListViewModel throught RatesService implementation)
class RatesAPIRateListViewModelAdapter: RatesService {
    let api: RatesAPI
    
    init(api: RatesAPI) {
        self.api = api
    }
    
    func loadRates(baseRate: String,completion: @escaping (Result<[Rate], Error>) -> Void) {
        api.fetchAllRates(baseRate: baseRate) { result in
            completion(result)
        }
    }
}
