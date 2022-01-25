//
//  RatesListViewModelTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 18/01/22.
//

import XCTest

class RatesListViewModelTests: XCTestCase {
    
    func testInit() {
        let service = RatesServiceDummy()
        let sut = RateListViewModel(rates: [Rate(code: "EUR", value: 200)], service: service)
                
        XCTAssertNotNil(sut.rates)
        XCTAssertNotNil(sut.service)
    }
    
    func testRatesAttribute() {
        let service = RatesServiceDummy()
        let sut = RateListViewModel(rates: [Rate(code: "EUR", value: 200)], service: service)
        
        XCTAssertEqual(sut.rates.count, 1)
        XCTAssertEqual(sut.rates.first?.code, "EUR")
        XCTAssertEqual(sut.rates.first?.value, 200)
    }
    
    func testNumbersOfRows() {
        let sut = RateListViewModel(rates: [Rate(code: "EUR", value: 200)], service: RatesServiceDummy())
        
        XCTAssertEqual(sut.numbersOfRows, 1)
    }
    
    func testReloadTableCall() {
        let service = RatesServiceDummy()
        let viewModel = RateListViewModel(rates: [], service: service)
        let vc = TestableRatesListController(viewModel: viewModel)
    
        XCTAssertFalse(vc.tableRelodCalled)
        vc.simulateDidLoad()
        vc.viewModel.reloadTable?()
        
        XCTAssertTrue(vc.tableRelodCalled)
    }
    
    func testShowErrorCall() {
        let service = RatesServiceDummy()
        let viewModel = RateListViewModel(rates: [], service: service)
        let vc = TestableRatesListController(viewModel: viewModel)
        
        XCTAssertFalse(vc.showErrorCalled)
        vc.simulateDidLoad()
        vc.viewModel.showError?(DefaultError(errorDescription: ""))
        
        XCTAssertTrue(vc.showErrorCalled)
    }
    
    func testLoadRatesCalled() {
        let service = RatesServiceSpy()
        let viewModel = RateListViewModel(rates: [], service: service)
        
        viewModel.loadRates()
        
        XCTAssertEqual(service.loadRatesCount, 1)
    }
    
    func testSetRatesReloadsTableData() {
        let service = RatesServiceDummy()
        let viewModel = RateListViewModel(rates: [], service: service)
        let vc = TestableRatesListController(viewModel: viewModel)
        
        XCTAssertFalse(vc.tableRelodCalled)
        
        vc.simulateDidLoad() /// Didload sets View model reloadTable action
        viewModel.rates = [Rate(code: "COP", value: 200)]
        
        XCTAssertTrue(vc.tableRelodCalled)
    }
}

private class TestableRatesListController: RatesListController {
    var tableRelodCalled = false
    var showErrorCalled = false
    
    override func viewDidLoad() {
        viewModel.reloadTable = { [weak self] in
            self?.tableRelodCalled = true
        }
        
        viewModel.showError = { [weak self] _ in
            self?.showErrorCalled = true
        }
    }
    
    func simulateDidLoad() {
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
    }
}



