//
//  
//  MessagesScreenInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol MessagesScreenInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol MessagesScreenInteractorOutputProtocol: AnyObject {
    
}

// MARK: - MessagesScreen InteractorInput
class MessagesScreenInteractorInput {
    weak var output: MessagesScreenInteractorOutputProtocol?
}

// MARK: - MessagesScreen InteractorInputProtocol
extension MessagesScreenInteractorInput: MessagesScreenInteractorInputProtocol {

}
