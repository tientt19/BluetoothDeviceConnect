//
//  
//  MessagesScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol MessagesScreenViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - MessagesScreen ViewModel
class MessagesScreenViewModel {
    weak var view: MessagesScreenViewProtocol?
    private var interactor: MessagesScreenInteractorInputProtocol

    init(interactor: MessagesScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - MessagesScreen ViewModelProtocol
extension MessagesScreenViewModel: MessagesScreenViewModelProtocol {
    func onViewDidLoad() {
        
    }
}

// MARK: - MessagesScreen InteractorOutputProtocol
extension MessagesScreenViewModel: MessagesScreenInteractorOutputProtocol {

}
