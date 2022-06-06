//
//  
//  DayNhayScreenRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 25/04/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol DayNhayScreenRouterProtocol {
    func goToDayNhayDetailScreen(with exerciseType: ExerciseTypes)
    func goToCountDownScreen(with exerciseType: ExerciseTypes)
    func goToLeaderBoardScreen()
}

// MARK: - DayNhayScreen Router
class DayNhayScreenRouter {
    weak var viewController: DayNhayScreenViewController?
    
    static func setupModule() -> DayNhayScreenViewController {
        let viewController = DayNhayScreenViewController()
        let router = DayNhayScreenRouter()
        let interactorInput = DayNhayScreenInteractorInput()
        let viewModel = DayNhayScreenViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - DayNhayScreen RouterProtocol
extension DayNhayScreenRouter: DayNhayScreenRouterProtocol {
    func goToDayNhayDetailScreen(with exerciseType: ExerciseTypes) {
        let vc = DayNhayDetailScreenRouter.setupModule(with: exerciseType)
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToCountDownScreen(with exerciseType: ExerciseTypes) {
        let preController = CountDownScreenRouter.setupModule(with: exerciseType)
        preController.countDownResponseDelegate = viewController
        preController.modalPresentationStyle = .fullScreen
        self.viewController?.present(preController, animated: true, completion: nil)
    }
    
    func goToLeaderBoardScreen() {
        let controller = LeaderBoardRouter.setupModule()
        self.viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
