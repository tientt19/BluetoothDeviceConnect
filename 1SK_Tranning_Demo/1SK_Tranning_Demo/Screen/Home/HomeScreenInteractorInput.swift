//
//  
//  HomeScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol HomeScreenInteractorInputProtocol {
}

// MARK: - Interactor Output Protocol
protocol HomeScreenInteractorOutputProtocol: AnyObject {
}

// MARK: - HomeScreen InteractorInput
class HomeScreenInteractorInput {
    weak var output: HomeScreenInteractorOutputProtocol?
}

// MARK: - HomeScreen InteractorInputProtocol
extension HomeScreenInteractorInput: HomeScreenInteractorInputProtocol {
   
}
