//
//  AppLocalization.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 25/01/22.
//

import Foundation

struct AppLocalization {
        
        enum RatesListKey: String {
            /// Rates list title
            case title = "ratesList.title"
            case searchBarTitle = "ratesList.searchBarTitle"
            
            var localizedString: String {
                return NSLocalizedString(self.rawValue, comment: "")
            }
        }
    
}
