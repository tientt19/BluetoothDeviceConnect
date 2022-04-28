//
//  
//  CountDownScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 28/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol CountDownScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol CountDownScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - CountDownScreen InteractorInput
class CountDownScreenInteractorInput {
    weak var output: CountDownScreenInteractorOutputProtocol?
}

// MARK: - CountDownScreen InteractorInputProtocol
extension CountDownScreenInteractorInput: CountDownScreenInteractorInputProtocol {

}
