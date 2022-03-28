//
//  VongDeoTayRouter.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation

class VongDeoTayRouter : VongDeoTayRouterProtocols {
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createVongDeoTayModule() -> UIViewController {
        
        let vongDeoTayViewController = storyboard.instantiateViewController(withIdentifier: "VongDeoTay") as! VongDeoTayViewController
        
        let presenter: VongDeoTayPresenter & VongDeoTayInteractorOutputProtocols = VongDeoTayPresenter()
        let interactor: VongDeoTayInteractorInputProtocols = VongDeoTayInteractor()
        let router = VongDeoTayRouter()
        
        vongDeoTayViewController.presenter = presenter
        presenter.view = vongDeoTayViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return vongDeoTayViewController
    }
}
