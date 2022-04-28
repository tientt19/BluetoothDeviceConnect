//
//  
//  DayNhayScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 25/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol DayNhayScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol DayNhayScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - DayNhayScreen InteractorInput
class DayNhayScreenInteractorInput {
    weak var output: DayNhayScreenInteractorOutputProtocol?
}

// MARK: - DayNhayScreen InteractorInputProtocol
extension DayNhayScreenInteractorInput: DayNhayScreenInteractorInputProtocol {

}
