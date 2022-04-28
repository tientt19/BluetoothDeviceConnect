//
//  
//  DayNhayScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 25/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol DayNhayScreenViewModelProtocol {
    func onViewDidLoad()
    
    //tableView
    func numberOfItems() -> Int?
    func itemInSection() -> Any?
}

// MARK: - DayNhayScreen ViewModel
class DayNhayScreenViewModel {
    weak var view: DayNhayScreenViewProtocol?
    private var interactor: DayNhayScreenInteractorInputProtocol

    init(interactor: DayNhayScreenInteractorInputProtocol) {
        self.interactor = interactor
    }
}

// MARK: - DayNhayScreen ViewModelProtocol
extension DayNhayScreenViewModel: DayNhayScreenViewModelProtocol {
    func onViewDidLoad() {
        
    }
    
    func numberOfItems() -> Int? {
        return 3
    }
    
    func itemInSection() -> Any? {
        return nil
    }
}

// MARK: - DayNhayScreen InteractorOutputProtocol
extension DayNhayScreenViewModel: DayNhayScreenInteractorOutputProtocol {

}
