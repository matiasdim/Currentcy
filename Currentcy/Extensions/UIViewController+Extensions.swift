//
//  UIViewController+Extensions.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

extension UIViewController {
    public func showError(_ error: Error) {
        let alert = UIAlertController(title: AppLocalization.GenericKeys.errorAlertTitle.localizedString,
                                      message: error.localizedDescription,
                                      preferredStyle:  .alert)
        
        alert.addAction(UIAlertAction(title: AppLocalization.GenericKeys.OkAlertButton.localizedString,
                                      style: .default))
        
        present(alert, animated: false)
    }
}
