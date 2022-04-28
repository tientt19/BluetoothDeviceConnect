//
//  
//  CountDownScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 28/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol CountDownScreenViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - CountDownScreen ViewModel
class CountDownScreenViewModel {
    weak var view: CountDownScreenViewProtocol?
    private var interactor: CountDownScreenInteractorInputProtocol

    init(interactor: CountDownScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - CountDownScreen ViewModelProtocol
extension CountDownScreenViewModel: CountDownScreenViewModelProtocol {
    func onViewDidLoad() {
        
    }
}

// MARK: - CountDownScreen InteractorOutputProtocol
extension CountDownScreenViewModel: CountDownScreenInteractorOutputProtocol {

}
