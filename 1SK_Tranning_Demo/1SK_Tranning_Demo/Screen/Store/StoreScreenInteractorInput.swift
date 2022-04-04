//
//  
//  StoreScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol StoreScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol StoreScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - StoreScreen InteractorInput
class StoreScreenInteractorInput {
    weak var output: StoreScreenInteractorOutputProtocol?
}

// MARK: - StoreScreen InteractorInputProtocol
extension StoreScreenInteractorInput: StoreScreenInteractorInputProtocol {

}
