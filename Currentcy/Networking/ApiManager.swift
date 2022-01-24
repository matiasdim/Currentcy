//
//  ApiManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 4/01/22.
//
import Foundation

protocol NetworkManager {
    func fetch(completion: @escaping (Result<Any, Error>) -> ())
}

struct ApiManager: NetworkManager {
    
    let session: URLSession
    let urlBuilder: URLBuilder/// = "http://api.exchangeratesapi.io/v1/latest?access_key=f1e8ee7c155b9e93a7ec3a3d9aba4a5d&base=USD"
    
    typealias CompletionHandler = Result<Any, Error>

    func fetch(completion: @escaping (Result<Any, Error>) -> ()) {
        guard let url = urlBuilder.url else {
            print("")
            return
        }
        
        session.dataTask(with: url) { Data, URLResponse, error in
            print("")
        }.resume()
        
        
    }
    
}
