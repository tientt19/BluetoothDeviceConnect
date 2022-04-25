//
//  
//  HomeScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol HomeScreenRouterProtocol {
    func openExerciseView()
    func openDayNhayScreen()
}

// MARK: - HomeScreen Router
class HomeScreenRouter {
    weak var viewController: HomeScreenViewController?
    
    static func setupModule() -> HomeScreenViewController {
        let viewController = HomeScreenViewController()
        let router = HomeScreenRouter()
        let interactorInput = HomeScreenInteractorInput()
        let viewModel = HomeScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - HomeScreen RouterProtocol
extension HomeScreenRouter: HomeScreenRouterProtocol {
    func openExerciseView() {
        let exerciseViewController = TrainingScreenRouter.setupModule()
        exerciseViewController.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(exerciseViewController, animated: true)
    }
    
    func openDayNhayScreen() {
        let daynhayScreen = DayNhayScreenRouter.setupModule()
        daynhayScreen.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(daynhayScreen, animated: true)
    }
}
