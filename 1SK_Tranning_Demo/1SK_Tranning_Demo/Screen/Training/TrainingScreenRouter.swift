//
//  
//  TrainingScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol TrainingScreenRouterProtocol {
    func openDetail()
}

// MARK: - TrainingScreen Router
class TrainingScreenRouter {
    weak var viewController: TrainingScreenViewController?
    
    static func setupModule() -> TrainingScreenViewController {
        let viewController = TrainingScreenViewController()
        let router = TrainingScreenRouter()
        let interactorInput = TrainingScreenInteractorInput()
        let viewModel = TrainingScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - TrainingScreen RouterProtocol
extension TrainingScreenRouter: TrainingScreenRouterProtocol {
    func openDetail() {
        let trainingDetailViewcontroller = TrainingDetailRouter.setupModule()
        trainingDetailViewcontroller.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(trainingDetailViewcontroller, animated: true)
    }
}
