//
//  NetworkManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 7/02/22.
//

protocol NetworkManager {
    func fetchAll(completion: @escaping (Result<Any, Error>) -> ())
    /// All all default calls fetch one, update one, update all, remove, create
}
