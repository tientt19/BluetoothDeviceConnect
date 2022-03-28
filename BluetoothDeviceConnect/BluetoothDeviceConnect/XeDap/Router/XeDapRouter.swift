//
//  XeDapRouter.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation

class XeDapRouter : XeDapRouterProtocols {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createXeDapModule() -> UIViewController {
        
        let xeDapViewController = storyboard.instantiateViewController(withIdentifier: "XeDap") as! XeDapViewController
        
        let presenter: XeDapPresenterProtocols & XeDapInteractorOutputProtocols = XeDapPresenter()
        let interactor: XeDapInteractorInputProtocols = XeDapInteractor()
        let router = XeDapRouter()
        
        xeDapViewController.presenter = presenter
        presenter.view = xeDapViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return xeDapViewController
    }
    
}
