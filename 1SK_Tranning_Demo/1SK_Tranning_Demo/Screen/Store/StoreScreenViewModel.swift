//
//  
//  StoreScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol StoreScreenViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - StoreScreen ViewModel
class StoreScreenViewModel {
    weak var view: StoreScreenViewProtocol?
    private var interactor: StoreScreenInteractorInputProtocol

    init(interactor: StoreScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - StoreScreen ViewModelProtocol
extension StoreScreenViewModel: StoreScreenViewModelProtocol {
    func onViewDidLoad() {
        
    }
}

// MARK: - StoreScreen InteractorOutputProtocol
extension StoreScreenViewModel: StoreScreenInteractorOutputProtocol {

}
