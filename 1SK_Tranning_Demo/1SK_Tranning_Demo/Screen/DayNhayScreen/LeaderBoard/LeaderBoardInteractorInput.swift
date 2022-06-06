//
//  
//  LeaderBoardInteractorInput.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 06/06/2022.
//
//

import UIKit

// MARK: - Interactor Input Protocol
protocol LeaderBoardInteractorInputProtocol {

}

// MARK: - Interactor Output Protocol
protocol LeaderBoardInteractorOutputProtocol: AnyObject {
    
}

// MARK: - LeaderBoard InteractorInput
class LeaderBoardInteractorInput {
    weak var output: LeaderBoardInteractorOutputProtocol?
}

// MARK: - LeaderBoard InteractorInputProtocol
extension LeaderBoardInteractorInput: LeaderBoardInteractorInputProtocol {

}
