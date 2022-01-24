//
//  URLBuilder.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//

import Foundation

struct URLBuilder {
    var builder: URLComponents
    
    var scheme: String? {
        didSet {
            builder.scheme = scheme
        }
    }
    
    var host: String? {
        didSet {
            builder.host = host
        }
    }
    
    var port: Int? {
        didSet {
            builder.port = port
        }
    }
    
    var path: String? {
        didSet {
            builder.path = path ?? ""
        }
    }
    
    var query: String? {
        didSet {
            builder.query = query
        }
    }
    
    var url: URL? {
        return builder.url
    }
}
