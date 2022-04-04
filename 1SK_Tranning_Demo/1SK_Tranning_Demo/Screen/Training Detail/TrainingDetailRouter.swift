//
//  
//  TrainingDetailRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 03/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol TrainingDetailRouterProtocol {
    func openDetailView()
}

// MARK: - TrainingDetail Router
class TrainingDetailRouter {
    weak var viewController: TrainingDetailViewController?
    
    static func setupModule() -> TrainingDetailViewController {
        let viewController = TrainingDetailViewController()
        let router = TrainingDetailRouter()
        let interactorInput = TrainingDetailInteractorInput()
        let viewModel = TrainingDetailViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - TrainingDetail RouterProtocol
extension TrainingDetailRouter: TrainingDetailRouterProtocol {
    func openDetailView() {
       
    }
}
