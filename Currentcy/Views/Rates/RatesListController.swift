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
    
    let reuseIdentifier = "reuseIdentifier"
    
    init(viewModel: RateListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        title = AppLocalization.RatesListKeys.title.localizedString
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.delegate = self
        searchController?.searchBar.delegate = self
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = AppLocalization.RatesListKeys.searchBarTitle.localizedString
        navigationItem.searchController = searchController
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
        return viewModel.numbersOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        cell.accessoryType = .disclosureIndicator
        
        let rateDetail = viewModel.rate(at: indexPath.row)
        cell.textLabel?.text = rateDetail.code
        cell.detailTextLabel?.text = "\(rateDetail.value)"
        
        return cell
    }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        show(viewModel.rate(at: indexPath.row))
    }
    
    private func show(_ rateDetail: RateDetailViewModel) {
        let vc = RateDetailViewController(viewModel: rateDetail)
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
