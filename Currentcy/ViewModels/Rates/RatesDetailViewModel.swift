//
//  RatesDetailViewModelTests.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//

struct RateDetailViewModel {
    var rate: Rate
    
    var code: String {
        return rate.code
    }
    
    var value: String {
        return String(rate.value)
    }
}
