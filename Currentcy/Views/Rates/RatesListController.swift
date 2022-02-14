//
//  RatesListController.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import UIKit

class RatesListController: UITableViewController {
    
    var viewModel: RateListViewModel
    var appTheming: AppTheming
    var stylesSource: RatesStyle
    var searchController: UISearchController?
    var activityIndicator: UIActivityIndicatorView?
    
    let reuseIdentifier = "reuseIdentifier"
    
    init(viewModel: RateListViewModel, appTheming: AppTheming, stylesSource: RatesStyle) {
        self.viewModel = viewModel
        self.appTheming = appTheming
        self.stylesSource = stylesSource
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
        activityIndicator = UIActivityIndicatorView(style: .large)
        title = AppLocalization.RatesListKeys.title.localizedString
        
        tableView.register(UINib(nibName: "RateTableViewCell", bundle: nil), forCellReuseIdentifier: RateTableViewCell.reuseIndentifier)
        tableView.separatorStyle = .none
        
        searchController = UISearchController(searchResultsController: nil)
        searchController?.delegate = self
        searchController?.searchBar.delegate = self
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = AppLocalization.RatesListKeys.searchBarTitle.localizedString
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        setStyle()
        setViewModelActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let activityIndicator = activityIndicator else { return }
        show(activityIndicator: activityIndicator)
        viewModel.loadRates()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RateTableViewCell.reuseIndentifier, for: indexPath) as? RateTableViewCell ?? RateTableViewCell(style: .default, reuseIdentifier: RateTableViewCell.reuseIndentifier)
        
        cell.configure(viewModel: viewModel.rate(at: indexPath.row), appTheming: appTheming, styles: stylesSource)
        
        return cell
    }
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        show(viewModel.rate(at: indexPath.row))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    private func show(_ rateDetail: RateDetailViewModel) {
        let vc = RateDetailViewController(viewModel: rateDetail)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setStyle() {
        stylesSource.mainView(tableView)
        stylesSource.searchController(searchController!)
        guard let navigationController = navigationController else { return }
        stylesSource.navigationStyle(navigationController)
    }
    
    private func setViewModelActions() {
        viewModel.reloadTable = { [weak self] in
            self?.tableView.reloadData()
            guard let activityIndicator = self?.activityIndicator else { return }
            self?.hide(activityIndicator: activityIndicator)
        }
        
        viewModel.showError = { [weak self] error in
            self?.showError(error)
        }
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
