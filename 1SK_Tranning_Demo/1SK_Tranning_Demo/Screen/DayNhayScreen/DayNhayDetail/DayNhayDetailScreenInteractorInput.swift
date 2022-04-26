//
//  
//  DayNhayDetailScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol DayNhayDetailScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol DayNhayDetailScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - DayNhayDetailScreen InteractorInput
class DayNhayDetailScreenInteractorInput {
    weak var output: DayNhayDetailScreenInteractorOutputProtocol?
}

// MARK: - DayNhayDetailScreen InteractorInputProtocol
extension DayNhayDetailScreenInteractorInput: DayNhayDetailScreenInteractorInputProtocol {

}
