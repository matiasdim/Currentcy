//
//  RatesListController.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

class RatesListController: UITableViewController {
    
    var viewModel: RateListViewModel
    
    init(viewModel: RateListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        title = "Rates"
        
        viewModel.reloadTable = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.showError = { [weak self] error in
            self?.showError(error)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadRates()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        
        let rate = viewModel.rates[indexPath.row]
        cell.textLabel?.text = rate.code
        cell.detailTextLabel?.text = "\(rate.value)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        show(viewModel.rates[indexPath.row])
    }
    
    private func show(_ rate: Rate) {
        let vc = RateDetailViewController(rate: rate)
        navigationController?.pushViewController(vc, animated: true)
    }
}
