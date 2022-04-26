//
//  
//  DayNhayDetailScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol DayNhayDetailScreenRouterProtocol {
    func goToResultScreen()
}

// MARK: - DayNhayDetailScreen Router
class DayNhayDetailScreenRouter {
    weak var viewController: DayNhayDetailScreenViewController?
    
    static func setupModule() -> DayNhayDetailScreenViewController {
        let viewController = DayNhayDetailScreenViewController()
        let router = DayNhayDetailScreenRouter()
        let interactorInput = DayNhayDetailScreenInteractorInput()
        let viewModel = DayNhayDetailScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - DayNhayDetailScreen RouterProtocol
extension DayNhayDetailScreenRouter: DayNhayDetailScreenRouterProtocol {
    func goToResultScreen() {
        let vc = DayNhayResultScreenRouter.setupModule()
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
