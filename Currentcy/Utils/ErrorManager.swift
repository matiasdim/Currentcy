//
//  ErrorManager.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

struct ErrorManager {
    var defaultError = DefaultError()
    var urlError = URLError()
}

struct DefaultError: LocalizedError {
    var errorDescription: String? = AppLocalization.GenericKeys.errorGenericMessage.localizedString
}

struct URLError: LocalizedError {
    var errorDescription: String? = AppLocalization.GenericKeys.urlErrorMessage.localizedString
}
