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
    func goToDayNhayDetailScreen(with exerciseType: ExerciseTypes)
}

// MARK: - CountDownScreen Router
class CountDownScreenRouter {
    weak var viewController: CountDownScreenViewController?
    
    static func setupModule(with exerciseType: ExerciseTypes) -> CountDownScreenViewController {
        let viewController = CountDownScreenViewController()
        let router = CountDownScreenRouter()
        let interactorInput = CountDownScreenInteractorInput()
        let viewModel = CountDownScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        viewController.exerciseType = exerciseType
        
        return viewController
    }
}

// MARK: - CountDownScreen RouterProtocol
extension CountDownScreenRouter: CountDownScreenRouterProtocol {
    func goToDayNhayDetailScreen(with exerciseType: ExerciseTypes) {
        let homeVC = DayNhayScreenRouter.setupModule()
        let detailVC = DayNhayDetailScreenRouter.setupModule(with: exerciseType)
        homeVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
