//
//  
//  HomeScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol HomeScreenViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - HomeScreen ViewModel
class HomeScreenViewModel {
    weak var view: HomeScreenViewProtocol?
    private var interactor: HomeScreenInteractorInputProtocol

    init(interactor: HomeScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - HomeScreen ViewModelProtocol
extension HomeScreenViewModel: HomeScreenViewModelProtocol {
    
    func onViewDidLoad() {
        
    }
}

// MARK: - HomeScreen InteractorOutputProtocol
extension HomeScreenViewModel: HomeScreenInteractorOutputProtocol {
    func didTapOpenView() {
        
    }
}
