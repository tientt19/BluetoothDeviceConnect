//
//  
//  TrainingDetailViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 03/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol TrainingDetailViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - TrainingDetail ViewModel
class TrainingDetailViewModel {
    weak var view: TrainingDetailViewProtocol?
    private var interactor: TrainingDetailInteractorInputProtocol

    init(interactor: TrainingDetailInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - TrainingDetail ViewModelProtocol
extension TrainingDetailViewModel: TrainingDetailViewModelProtocol {
    
    func onViewDidLoad() {
        
    }
}

// MARK: - TrainingDetail InteractorOutputProtocol
extension TrainingDetailViewModel: TrainingDetailInteractorOutputProtocol {

}
