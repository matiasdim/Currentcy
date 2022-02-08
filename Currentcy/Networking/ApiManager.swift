//
//  ApiManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 4/01/22.
//
import Foundation

struct ApiManager: NetworkManager {
    
    let session: URLSession
    var urlBuilder: URLBuilder? = nil
    
    func fetchAll(completion: @escaping (Result<Any, Error>) -> ()) {
        guard let url = urlBuilder?.url else {
            completion(.failure(URLError()))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let data = data {
                completion(.success(data))
            }
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(DefaultError()))
            }
        }.resume()
        
        
    }
    
}
