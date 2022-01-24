//
//  RateDetailViewController.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

class RateDetailViewController: UIViewController {
    var viewModel: RateDetailViewModel
    
    var valueLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: RateDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        title = viewModel.code
        
        valueLabel.text = String(viewModel.value)
        view.addSubview(valueLabel)
        NSLayoutConstraint.activate([valueLabel.topAnchor.constraint(equalTo: view.topAnchor),
                                     valueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     valueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     valueLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
