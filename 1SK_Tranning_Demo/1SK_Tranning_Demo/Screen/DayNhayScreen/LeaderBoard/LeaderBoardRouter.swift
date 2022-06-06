//
//  
//  LeaderBoardRouter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 06/06/2022.
//
//

import UIKit

// MARK: - RouterProtocol
protocol LeaderBoardRouterProtocol {

}

// MARK: - LeaderBoard Router
class LeaderBoardRouter {
    weak var viewController: LeaderBoardViewController?
    
    static func setupModule() -> LeaderBoardViewController {
        let viewController = LeaderBoardViewController()
        let router = LeaderBoardRouter()
        let interactorInput = LeaderBoardInteractorInput()
        let viewModel = LeaderBoardViewModel(interactor: interactorInput)
        
        viewController.viewModel = viewModel
        viewController.router = router
        viewModel.view = viewController
        interactorInput.output = viewModel
        router.viewController = viewController
        
        return viewController
    }
}

// MARK: - LeaderBoard RouterProtocol
extension LeaderBoardRouter: LeaderBoardRouterProtocol {
    
}
