//
//  
//  MessagesScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol MessagesScreenRouterProtocol {

}

// MARK: - MessagesScreen Router
class MessagesScreenRouter {
    weak var viewController: MessagesScreenViewController?
    
    static func setupModule() -> MessagesScreenViewController {
        let viewController = MessagesScreenViewController()
        let router = MessagesScreenRouter()
        let interactorInput = MessagesScreenInteractorInput()
        let viewModel = MessagesScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - MessagesScreen RouterProtocol
extension MessagesScreenRouter: MessagesScreenRouterProtocol {
    
}
