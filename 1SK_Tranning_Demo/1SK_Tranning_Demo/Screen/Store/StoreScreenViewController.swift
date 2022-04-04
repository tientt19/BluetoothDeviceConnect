//
//  
//  StoreScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol StoreScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - StoreScreen ViewController
class StoreScreenViewController: BaseViewController {
    var router: StoreScreenRouterProtocol!
    var viewModel: StoreScreenViewModelProtocol!
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    // MARK: - Init
    private func setupInit() {

    }
    
    // MARK: - Action
    
}

// MARK: - StoreScreen ViewProtocol
extension StoreScreenViewController: StoreScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
