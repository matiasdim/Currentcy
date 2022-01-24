//
//  RateDetailViewController.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

class RateDetailViewController: UIViewController {
    var rate: Rate
    
    init(rate: Rate) {
        self.rate = rate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
