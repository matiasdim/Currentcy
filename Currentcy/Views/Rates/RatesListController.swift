//
//  RatesListController.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

class RatesListController: UITableViewController {
    
    var viewModel: RateListViewModel
    var searchController: UISearchController?
    
    init(viewModel: RateListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        title = AppLocalization.RatesListKey.title.localizedString
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.delegate = self
        searchController?.searchBar.delegate = self
        // 1
        searchController?.searchResultsUpdater = self
        // 2
        searchController?.obscuresBackgroundDuringPresentation = false
        // 3
        searchController?.searchBar.placeholder = AppLocalization.RatesListKey.searchBarTitle.localizedString
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
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
        let vc = RateDetailViewController(viewModel: RateDetailViewModel(rate: rate))
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension RatesListController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
}

extension RatesListController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /// Implement
    }
}
