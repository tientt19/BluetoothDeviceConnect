//
//  VongDeoTayProtocols.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation

protocol VongDeoTayViewProtocols : AnyObject {
    var presenter : VongDeoTayPresenter? { get set}
    
    // PRESENTER -> VIEW
}

protocol VongDeoTayPresenterProtocols : AnyObject {
    var view: VongDeoTayViewProtocols? { get set }
    var interactor: VongDeoTayInteractorInputProtocols? { get set }
    var router: VongDeoTayRouterProtocols? { get set }
    
    
    // VIEW -> PRESENTER
}

protocol VongDeoTayInteractorInputProtocols : AnyObject {
    var presenter : VongDeoTayInteractorOutputProtocols? { get set }
    
    // PRESENTER -> INTERACTOR
}

protocol VongDeoTayInteractorOutputProtocols : AnyObject {
    
    // INTERACTOR -> PRESENTER
}

protocol VongDeoTayRouterProtocols : AnyObject {
    static func createVongDeoTayModule() -> UIViewController
    
    // PRESENTER -> ROUTER
}
