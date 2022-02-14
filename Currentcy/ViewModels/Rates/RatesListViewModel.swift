//
//  RatesListViewModel.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import Foundation

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
                    let sortedRates = rates.sorted(by: { $0.code < $1.code })
                    self?.rates = sortedRates
                case .failure(let error):
                    self?.showError?(error)
            }
        }
    }
    
    func rate(at index: Int) -> RateDetailViewModel {
        return RateDetailViewModel(rate: rates[index])
    }
}
