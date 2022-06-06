//
//  
//  LeaderBoardViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 06/06/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol LeaderBoardViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - LeaderBoard ViewModel
class LeaderBoardViewModel {
    weak var view: LeaderBoardViewProtocol?
    private var interactor: LeaderBoardInteractorInputProtocol

    init(interactor: LeaderBoardInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - LeaderBoard ViewModelProtocol
extension LeaderBoardViewModel: LeaderBoardViewModelProtocol {
    func onViewDidLoad() {
        
    }
}

// MARK: - LeaderBoard InteractorOutputProtocol
extension LeaderBoardViewModel: LeaderBoardInteractorOutputProtocol {

}
