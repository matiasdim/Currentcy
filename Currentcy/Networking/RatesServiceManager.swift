//
//  RatesServiceManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import Foundation

class RatesAPI {
    var apiManager: ApiManager
    
    let ratesAPIScheme = "https"
    let ratesAPIHost = "freecurrencyapi.net"
    let ratesAPIPort = 80
    let ratesAPIPath = "/api/v2/latest"
    var ratesAPIQuery = "apikey=1a7ff870-88e3-11ec-9880-db412896d8a5"

    init(APIManager: ApiManager) {
        self.apiManager = APIManager
    }
    
    func fetchAllRates(baseRate: String, completion: @escaping (Result<[Rate], Error>) -> Void) {
        var urlBuilder = URLBuilder(builder: URLComponents())
        urlBuilder.scheme = ratesAPIScheme
        urlBuilder.host = ratesAPIHost
        urlBuilder.port = nil
        urlBuilder.path = ratesAPIPath
        urlBuilder.query = ratesAPIQuery + "&base_currency=\(baseRate)"
        apiManager.urlBuilder = urlBuilder
        
        apiManager.fetchAll { result in
            switch result {
                case .success(let data):
                    if let data = data as? Data {
                        do {
                            let response = try JSONDecoder().decode(RatesResponse.self, from: data)
                            completion(.success(response.rates))
                        } catch {
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        
        }
    }
    
}


class RatesAPIMock: RatesAPI {
    override func fetchAllRates(baseRate: String, completion: @escaping (Result<[Rate], Error>) -> Void) {
        completion(Result.success([Rate(code: "USD", value: 200),
                                   Rate(code: "COP", value: 1000),
                                   Rate(code: "EUR", value: 200)]))
    }
}
