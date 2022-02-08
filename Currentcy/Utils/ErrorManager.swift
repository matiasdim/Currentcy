//
//  ErrorManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

struct DefaultError: LocalizedError {
    var errorDescription: String? = "Error, inténtelo de nuevo más tarde"
}

struct URLError: LocalizedError {
    var errorDescription: String? = "Error en la URL"
}
