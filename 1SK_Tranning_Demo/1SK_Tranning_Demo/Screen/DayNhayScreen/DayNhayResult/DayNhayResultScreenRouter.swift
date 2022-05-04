//
//  
//  DayNhayResultScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol DayNhayResultScreenRouterProtocol {
    func goToHomeScreen() 
}

// MARK: - DayNhayResultScreen Router
class DayNhayResultScreenRouter {
    weak var viewController: DayNhayResultScreenViewController?
    
    static func setupModule() -> DayNhayResultScreenViewController {
        let viewController = DayNhayResultScreenViewController()
        let router = DayNhayResultScreenRouter()
        let interactorInput = DayNhayResultScreenInteractorInput()
        let viewModel = DayNhayResultScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - DayNhayResultScreen RouterProtocol
extension DayNhayResultScreenRouter: DayNhayResultScreenRouterProtocol {
    func goToHomeScreen() {
        self.viewController?.navigationController?.popToRootViewController(animated: true)
    }
}
