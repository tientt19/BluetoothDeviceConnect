//
//  
//  ProfileScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol ProfileScreenRouterProtocol {

}

// MARK: - ProfileScreen Router
class ProfileScreenRouter {
    weak var viewController: ProfileScreenViewController?
    
    static func setupModule() -> ProfileScreenViewController {
        let viewController = ProfileScreenViewController()
        let router = ProfileScreenRouter()
        let interactorInput = ProfileScreenInteractorInput()
        let viewModel = ProfileScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - ProfileScreen RouterProtocol
extension ProfileScreenRouter: ProfileScreenRouterProtocol {
    
}
