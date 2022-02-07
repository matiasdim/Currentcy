//
//  RatesListTests.swift
//  RatesTests
//
//  Created by Matías  Gil Echavarría on 12/01/22.
//

import XCTest
/// Arrange
/// Act
/// Assert

class RatesList: XCTestCase {
    
    func testViewTitleSetOnDidLoad() {
        let service = RatesServiceSpy()
        let sut = RatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.loadViewIfNeeded()
        XCTAssertEqual(AppLocalization.RatesListKey.title.localizedString, sut.title)
    }
    
    func testSetViewModelFunctionsOnLoad() {
        let service = RatesServiceSpy()
        let viewModel = RateListViewModel(rates: [], service: service)
        let sut = RatesListController(viewModel: viewModel)
        
        XCTAssertNil(sut.viewModel.reloadTable)
        XCTAssertNil(sut.viewModel.showError)
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.viewModel.reloadTable)
        XCTAssertNotNil(sut.viewModel.showError)
    }
    
    func testViewDidLoadDoesNotLoadRatesFromAPI() {
        let service = RatesServiceSpy()
        let sut = RatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.loadViewIfNeeded()
                
        XCTAssertEqual(service.loadRatesCount, 0) /// A way to test loadRatesCount is not being called
    }
    
    func testViewWillAppearLoadRatesFromAPI() {
        let service = RatesServiceSpy()
        let sut = RatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.simulateWillAppear()
        
        XCTAssertEqual(service.loadRatesCount, 1)
    }

    func testViewWillAppearSuccessfulAPIResponseShowRates() {
        let rate1 = Rate(code: "USD", value: 2101.02)
        let rate2 = Rate(code: "COP", value: 102)
        let service = RatesServiceSpy(result: .success([rate1, rate2]))
        let sut = RatesListController(viewModel: RateListViewModel(rates: [rate1, rate2], service: service))
        
        sut.simulateWillAppear()
        
        sut.assert(isRendering: [rate1, rate2])
    }
    
    func testViewWillAppearFailedAPIResponseShowError() {
        let service = RatesServiceSpy(result: .failure(DefaultError(errorDescription: "an error")))
        let sut = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.simulateWillAppear()
        
        XCTAssertEqual(sut.errorMessage(), "an error")
    }
     
    func testRateSelectionShowRateDetails() {
        let rate = Rate(code: "USD", value: 2101.02)
        let service = RatesServiceSpy(result: .success([rate]))
        let sut = RatesListController(viewModel: RateListViewModel(rates: [rate], service: service))
        let navigation = NonAnimatedUINavigationController(rootViewController: sut)
        
        sut.simulateWillAppear()
        sut.selectRate(at: 0)
        
        let detail = navigation.topViewController as? RateDetailViewController
        
        XCTAssertEqual(detail?.viewModel.rate, rate)
    }
    
    func testNumbersOfRowsInSection() {
        let rate = Rate(code: "USD", value: 2101.02)
        let service = RatesServiceSpy(result: .success([rate]))
        let sut = RatesListController(viewModel: RateListViewModel(rates: [rate], service: service))
        
        XCTAssertEqual(sut.numberOfRowsInSection(), 1)
    }
    
    func testSearchControlPlaceholderTitle() {
        let service = RatesServiceSpy(result: .failure(DefaultError(errorDescription: "an error")))
        let sut = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.simulateWillAppear()
        
        let placeHolder = sut.navigationItem.searchController?.searchBar.placeholder
        
        XCTAssertEqual(placeHolder, AppLocalization.RatesListKey.searchBarTitle.localizedString)
    }
    
    func testSearchControllerIsPresented() {
        let service = RatesServiceSpy(result: .failure(DefaultError(errorDescription: "an error")))
        let sut = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.simulateWillAppear()
                
        sut.presentSearchController()
        
        XCTAssertEqual(sut.searchControllerPresented, true)
    }
    
    
    func testSearchControlCallsDelegteWhenTextChanges() {
        let service = RatesServiceSpy(result: .failure(DefaultError(errorDescription: "an error")))
        let sut = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        sut.simulateWillAppear()
        
        XCTAssertEqual(false, sut.textDidChangeCalled)
        
        sut.searchBarTextChange()
        
        XCTAssertEqual(true, sut.textDidChangeCalled)
        
    }
    
}

// MARK: - Test utilities

private class NonAnimatedUINavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}

private class TestableRatesListController: RatesListController {
    var presentedVC: UIViewController?
    var searchControllerPresented = false
    var searchResultCalled = false
    var textDidChangeCalled = false
    
    override func updateSearchResults(for searchController: UISearchController) {
        searchResultCalled = true
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
    }

    func errorMessage() -> String? {
        let alert = presentedVC as? UIAlertController
        return alert?.message
    }
    
    func presentSearchController() {
        searchController?.isActive = true
    }
    
    func searchBarTextChange() {
        searchBar(searchController!.searchBar, textDidChange: "aaa")
    }
    
    func presentSearchController(_ searchController: UISearchController) {
        searchControllerPresented = true
    }

    override func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        textDidChangeCalled = true
    }
}

private extension RatesListController {
    func simulateWillAppear() {
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
    }
    
    func assert(isRendering rates: [Rate]) {
        XCTAssertEqual(numberOfRates(), rates.count)
        
        for (index, rate) in rates.enumerated() {
            XCTAssertEqual(rateCode(at: index), rate.code)
            XCTAssertEqual(rateValue(at: index), "\(rate.value)")
        }
    }
    
    func numberOfRates() -> Int {
        tableView.numberOfRows(inSection: 0)
    }
    
    func rateCode(at row: Int) -> String? {
        return rateCell(at: row)?.textLabel?.text
    }
    
    func rateValue(at row: Int) -> String? {
        return rateCell(at: row)?.detailTextLabel?.text
    }
    
    func selectRate(at row: Int) {
        tableView.delegate?.tableView?(tableView, didSelectRowAt: IndexPath(row: row, section: 0))
    }
    
    func show(_ rate: Rate) {
        let vc = RateDetailViewController(viewModel: RateDetailViewModel(rate: Rate(code: "EUR", value: 200)))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfRowsInSection() -> Int? {
        return tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0)
    }
    
    private func rateCell(at row: Int) -> UITableViewCell? {
        return tableView.dataSource?.tableView(tableView, cellForRowAt: IndexPath(row: row, section: 0))
    }

}

