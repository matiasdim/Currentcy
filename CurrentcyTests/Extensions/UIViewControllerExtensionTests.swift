//
//  UIViewControllerExtensionTests.swift
//  CurrentcyTests
//
//  Created by Matías  Gil Echavarría on 24/01/22.
//

import XCTest

class UIViewControllerExtensionTests: XCTestCase {

    func testShowErrorAlert() {
        let service = RatesServiceSpy()
        let sut = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        let errorDescription = AppLocalization.GenericKeys.errorGenericMessage.localizedString
        let errorManager = ErrorManager()

        sut.simulateWillAppear()

        sut.showError(errorManager.defaultError)

        XCTAssertEqual(sut.errorTitle(), AppLocalization.GenericKeys.errorAlertTitle.localizedString)
        XCTAssertEqual(sut.errorMessage(), errorDescription)
        XCTAssertEqual(sut.errorCancelButtonTitle(), AppLocalization.GenericKeys.OkAlertButton.localizedString)
    }
    
    func testActivityIndicatorIsShown() {
        let sut = UIActivityIndicatorView(style: .large)
        let service = RatesServiceSpy()
        let vc = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        vc.simulateWillAppear()
        vc.show(activityIndicator: sut)
        
        XCTAssertEqual(vc.presentedActivityIndicator(), sut)
    }
    
    func testActivityIndicatorIsHidden() {
        let sut = UIActivityIndicatorView(style: .large)
        let service = RatesServiceSpy()
        let vc = TestableRatesListController(viewModel: RateListViewModel(rates: [], service: service))
        
        vc.simulateWillAppear()
        vc.show(activityIndicator: sut)
        vc.hide(activityIndicator: sut)
        
        XCTAssertNotEqual(vc.presentedActivityIndicator(), sut)
    }

}

private class TestableRatesListController: RatesListController {
    var presentedVC: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
    }
    
    func simulateWillAppear() {
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
        
    }
    
    func presentedActivityIndicator() -> UIActivityIndicatorView? {
        return view.subviews.last as? UIActivityIndicatorView
    }
    
    func errorTitle() -> String? {
        return presentedAlertController()?.title
    }
    
    func errorMessage() -> String? {
        return presentedAlertController()?.message
    }
    
    func errorCancelButtonTitle() -> String? {
        return presentedAlertController()?.actions.first?.title
    }
    
    private func presentedAlertController() -> UIAlertController? {
        return presentedVC as? UIAlertController
    }
}

