//
//  
//  StoreScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol StoreScreenRouterProtocol {

}

// MARK: - StoreScreen Router
class StoreScreenRouter {
    weak var viewController: StoreScreenViewController?
    
    static func setupModule() -> StoreScreenViewController {
        let viewController = StoreScreenViewController()
        let router = StoreScreenRouter()
        let interactorInput = StoreScreenInteractorInput()
        let viewModel = StoreScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - StoreScreen RouterProtocol
extension StoreScreenRouter: StoreScreenRouterProtocol {
    
}
