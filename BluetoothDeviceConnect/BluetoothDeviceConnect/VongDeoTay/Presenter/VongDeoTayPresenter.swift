//
//  VongDeoTayPresenter.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation


class VongDeoTayPresenter : VongDeoTayPresenterProtocols {
    
    weak var view: VongDeoTayViewProtocols?
    var interactor: VongDeoTayInteractorInputProtocols?
    var router: VongDeoTayRouterProtocols?
    
    
}

extension VongDeoTayPresenter : VongDeoTayInteractorOutputProtocols {
    
}
