//
//  AppLocalization.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 25/01/22.
//

import Foundation

struct AppLocalization {
    
    enum GenericKeys: String {
        case errorAlertTitle = "generic.alert.error.title"
        
        case OkAlertButton = "generic.alert.button.ok.title"
        
        var localizedString: String {
            return AppLocalization.localize(key: self.rawValue)
        }
    }
    
    enum RatesListKeys: String {
        /// Rates list title
        case title = "ratesList.title"
        case searchBarTitle = "ratesList.searchBarTitle"
        
        var localizedString: String {
            return AppLocalization.localize(key: self.rawValue)
        }
    }
    
    fileprivate static func localize(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }

}
