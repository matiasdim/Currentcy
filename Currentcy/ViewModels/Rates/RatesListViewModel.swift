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
        service.loadRates { [weak self] result in
            switch result {
                case .success(let rates):
                    self?.rates = rates
                case .failure(let error):
                    self?.showError?(error)
            }
        }
    }
    
}
