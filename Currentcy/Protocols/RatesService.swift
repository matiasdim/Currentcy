//
//  RatesService.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

protocol RatesService {
    func loadRates(baseRate: String, completion: @escaping (Result<[Rate], Error>) -> Void)
}
