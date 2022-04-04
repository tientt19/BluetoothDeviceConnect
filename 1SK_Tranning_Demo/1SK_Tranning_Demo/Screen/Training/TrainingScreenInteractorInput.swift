//
//  
//  TrainingScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol TrainingScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol TrainingScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - TrainingScreen InteractorInput
class TrainingScreenInteractorInput {
    weak var output: TrainingScreenInteractorOutputProtocol?
}

// MARK: - TrainingScreen InteractorInputProtocol
extension TrainingScreenInteractorInput: TrainingScreenInteractorInputProtocol {

}
