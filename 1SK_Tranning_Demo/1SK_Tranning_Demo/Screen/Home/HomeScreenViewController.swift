//
//  
//  HomeScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol HomeScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - HomeScreen ViewController
class HomeScreenViewController: BaseViewController {
    var router: HomeScreenRouterProtocol!
    var viewModel: HomeScreenViewModelProtocol!
    
    @IBOutlet weak var openExercise : UIView!

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    // MARK: - Init
    private func setupInit() {
        openExercise.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openView)))
    }
    
    // MARK: - Action
    @objc func openView() {
        router.openExerciseView()
    }
}

// MARK: - HomeScreen ViewProtocol
extension HomeScreenViewController: HomeScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
