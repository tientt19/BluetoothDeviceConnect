//
//  
//  DayNhayDetailScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol DayNhayDetailScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - DayNhayDetailScreen ViewController
class DayNhayDetailScreenViewController: BaseViewController {
    var router: DayNhayDetailScreenRouterProtocol!
    var viewModel: DayNhayDetailScreenViewModelProtocol!
    
    @IBOutlet weak var view_jumpCycle1: UIView!
    @IBOutlet weak var view_jumpCycle2: UIView!
    

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view_jumpCycle1.layer.masksToBounds = true
        view_jumpCycle2.layer.masksToBounds = true
        view_jumpCycle1.layer.cornerRadius = view_jumpCycle1.frame.height / 2
        view_jumpCycle2.layer.cornerRadius = view_jumpCycle2.frame.height / 2
    }
    
    // MARK: - Init
    private func setupInit() {
        self.title = "Nhảy tự do"
        self.dayNhayNavigationView()
        self.setUpShadow()
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "bell_image"), style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    // MARK: - Action
    
    @IBAction func onCompleteTap(_ sender: UIButton) {
        router.goToResultScreen()
    }
}

// MARK: - DayNhayDetailScreen ViewProtocol
extension DayNhayDetailScreenViewController: DayNhayDetailScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
