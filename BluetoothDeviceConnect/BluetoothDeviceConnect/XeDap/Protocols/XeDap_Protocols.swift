//
//  XeDap_Protocols.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation
import UIKit

protocol XeDapViewProtocols : AnyObject {
    var presenter : XeDapPresenterProtocols? { get set}
    
    // PRESENTER -> VIEW
    func presentDataToView(_ data : CharacteristicIndoorBikeData)
}

protocol XeDapPresenterProtocols : AnyObject {
    var view: XeDapViewProtocols? { get set }
    var interactor: XeDapInteractorInputProtocols? { get set }
    var router: XeDapRouterProtocols? { get set }
    
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}

protocol XeDapInteractorInputProtocols : AnyObject {
    var presenter : XeDapInteractorOutputProtocols? { get set }
    
    // PRESENTER -> INTERACTOR
    func handleDecodeHRMess(sensorData : Data)
    func setUpCentralManager()
}

protocol XeDapInteractorOutputProtocols : AnyObject {
    
    // INTERACTOR -> PRESENTER
    func didReceiveData(_ data : CharacteristicIndoorBikeData)
}

protocol XeDapRouterProtocols : AnyObject {
    static func createXeDapModule() -> UIViewController
    
    // PRESENTER -> ROUTER
}
