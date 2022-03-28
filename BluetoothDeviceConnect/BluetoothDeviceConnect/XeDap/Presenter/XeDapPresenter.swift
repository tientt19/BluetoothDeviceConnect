//
//  XeDapPresenter.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation

class XeDapPresenter : XeDapPresenterProtocols {
  
    weak var view: XeDapViewProtocols?
    var interactor: XeDapInteractorInputProtocols?
    var router: XeDapRouterProtocols?
    
    func doDecodeHRMess(sensorData: Data) {
        interactor?.handleDecodeHRMess(sensorData: sensorData)
    }
    
    func viewDidLoad() {
        interactor?.setUpCentralManager()
    }
}

extension XeDapPresenter : XeDapInteractorOutputProtocols {
    func didReceiveData(_ data: CharacteristicIndoorBikeData) {
        view?.presentDataToView(data)
    }
}
