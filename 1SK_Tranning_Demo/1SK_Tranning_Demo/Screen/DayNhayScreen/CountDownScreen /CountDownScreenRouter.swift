//
//  
//  CountDownScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 28/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol CountDownScreenRouterProtocol {
    func goToDayNhayDetailScreen()
}

// MARK: - CountDownScreen Router
class CountDownScreenRouter {
    weak var viewController: CountDownScreenViewController?
    
    static func setupModule() -> CountDownScreenViewController {
        let viewController = CountDownScreenViewController()
        let router = CountDownScreenRouter()
        let interactorInput = CountDownScreenInteractorInput()
        let viewModel = CountDownScreenViewModel(interactor: interactorInput)
        let homeVC = DayNhayScreenViewController()
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        viewController.countDownResponseDelegate = homeVC
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - CountDownScreen RouterProtocol
extension CountDownScreenRouter: CountDownScreenRouterProtocol {
    func goToDayNhayDetailScreen() {
        let homeVC = DayNhayScreenRouter.setupModule()
        let detailVC = DayNhayDetailScreenRouter.setupModule()
        homeVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
