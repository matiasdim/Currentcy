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
        let sut = TestableRatesListControllerShowingAlertError(viewModel: RateListViewModel(rates: [], service: service))
        let errorDescription = "Test description"

        sut.loadViewIfNeeded()
        sut.beginAppearanceTransition(true, animated: false)

        sut.showError(DefaultError(errorDescription: errorDescription))

        XCTAssertEqual(sut.errorTitle(), "Error")
        XCTAssertEqual(sut.errorMessage(), errorDescription)
        XCTAssertEqual(sut.errorCancelButtonTitle(), "OK")
    }

}

private class TestableRatesListControllerShowingAlertError: RatesListController {
    var presentedVC: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
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

