//
//  
//  DayNhayDetailScreenViewModel.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - ViewModelProtocol
protocol DayNhayDetailScreenViewModelProtocol {
    func onViewDidLoad()
}

// MARK: - DayNhayDetailScreen ViewModel
class DayNhayDetailScreenViewModel {
    weak var view: DayNhayDetailScreenViewProtocol?
    private var interactor: DayNhayDetailScreenInteractorInputProtocol

    init(interactor: DayNhayDetailScreenInteractorInputProtocol) {
        self.interactor = interactor
    }

}

// MARK: - DayNhayDetailScreen ViewModelProtocol
extension DayNhayDetailScreenViewModel: DayNhayDetailScreenViewModelProtocol {
    func onViewDidLoad() {
        
    }
}

// MARK: - DayNhayDetailScreen InteractorOutputProtocol
extension DayNhayDetailScreenViewModel: DayNhayDetailScreenInteractorOutputProtocol {

}
