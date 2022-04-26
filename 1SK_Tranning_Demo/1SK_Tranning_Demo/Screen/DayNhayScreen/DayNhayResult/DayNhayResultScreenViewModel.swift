//
//  
//  DayNhayResultScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol DayNhayResultScreenViewModelProtocol {
    func onViewDidLoad()
    
    //tableView
    func numberOfItems() -> Int?
    func itemInSection() -> Any?
}

// MARK: - DayNhayResultScreen ViewModel
class DayNhayResultScreenViewModel {
    weak var view: DayNhayResultScreenViewProtocol?
    private var interactor: DayNhayResultScreenInteractorInputProtocol

    init(interactor: DayNhayResultScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - DayNhayResultScreen ViewModelProtocol
extension DayNhayResultScreenViewModel: DayNhayResultScreenViewModelProtocol {
    func numberOfItems() -> Int? {
        return 3
    }
    
    func itemInSection() -> Any? {
        return nil
    }
    
    func onViewDidLoad() {
        
    }
}

// MARK: - DayNhayResultScreen InteractorOutputProtocol
extension DayNhayResultScreenViewModel: DayNhayResultScreenInteractorOutputProtocol {

}
