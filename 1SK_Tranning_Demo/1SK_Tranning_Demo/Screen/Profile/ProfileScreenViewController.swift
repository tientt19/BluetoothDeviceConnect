//
//  
//  ProfileScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol ProfileScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - ProfileScreen ViewController
class ProfileScreenViewController: BaseViewController {
    var router: ProfileScreenRouterProtocol!
    var viewModel: ProfileScreenViewModelProtocol!
    
    
    
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

// MARK: - ProfileScreen ViewProtocol
extension ProfileScreenViewController: ProfileScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
