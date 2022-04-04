//
//  
//  TrainingDetailInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 03/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol TrainingDetailInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol TrainingDetailInteractorOutputProtocol: AnyObject {
    
}

// MARK: - TrainingDetail InteractorInput
class TrainingDetailInteractorInput {
    weak var output: TrainingDetailInteractorOutputProtocol?
}

// MARK: - TrainingDetail InteractorInputProtocol
extension TrainingDetailInteractorInput: TrainingDetailInteractorInputProtocol {

}
