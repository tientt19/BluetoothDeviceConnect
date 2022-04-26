//
//  
//  DayNhayResultScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol DayNhayResultScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol DayNhayResultScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - DayNhayResultScreen InteractorInput
class DayNhayResultScreenInteractorInput {
    weak var output: DayNhayResultScreenInteractorOutputProtocol?
}

// MARK: - DayNhayResultScreen InteractorInputProtocol
extension DayNhayResultScreenInteractorInput: DayNhayResultScreenInteractorInputProtocol {

}
