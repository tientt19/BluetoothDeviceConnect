//
//  
//  TrainingScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol TrainingScreenViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - TrainingScreen ViewModel
class TrainingScreenViewModel {
    weak var view: TrainingScreenViewProtocol?
    private var interactor: TrainingScreenInteractorInputProtocol

    init(interactor: TrainingScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - TrainingScreen ViewModelProtocol
extension TrainingScreenViewModel: TrainingScreenViewModelProtocol {
    func onViewDidLoad() {
        
    }
}

// MARK: - TrainingScreen InteractorOutputProtocol
extension TrainingScreenViewModel: TrainingScreenInteractorOutputProtocol {

}
