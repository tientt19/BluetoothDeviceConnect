//
//  
//  CountDownScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 28/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol CountDownScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

protocol CountDownResponeProtocol: AnyObject {
    func goToDetailScreen(_ vc : UIViewController)
}

// MARK: - CountDownScreen ViewController
class CountDownScreenViewController: BaseViewController {
    var router: CountDownScreenRouterProtocol!
    var viewModel: CountDownScreenViewModelProtocol!
    var countDownResponseDelegate: CountDownResponeProtocol?

    var circleProgressView = CircleProgressView()
    
    @IBOutlet weak var view_countDown: UIView!
    @IBOutlet weak var view_countDown_Parent: UIView!
    @IBOutlet weak var lbl_start: UILabel!

    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view_countDown_Parent.layer.masksToBounds = true
        view_countDown_Parent.layer.cornerRadius = view_countDown_Parent.frame.height / 2
        
        view_countDown.layer.masksToBounds = true
        view_countDown.layer.cornerRadius = view_countDown.frame.height / 2
    }
    
    
    // MARK: - Init
    private func setupInit() {
        self.setCountdownProgressView()
    }
    
    // MARK: - Action
    
}

extension CountDownScreenViewController: CircleProgressViewDelegate {
    
    func setCountdownProgressView() {
        self.circleProgressView.frame = self.view_countDown.bounds
        self.circleProgressView.delegate = self
        self.circleProgressView.timeInterval = 3
        self.circleProgressView.createCircularPath()
        self.circleProgressView.startProgress()
        self.view_countDown.addSubview(self.circleProgressView)
    }
    
    func onCountdownStartPlaySuccess() {
        self.view_countDown_Parent.isHidden = true
        lbl_start.isHidden = false
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(goToDetailScreen), userInfo: nil, repeats: false)
    }
    
    @objc func goToDetailScreen() {
        self.dismiss(animated: false) {
            self.countDownResponseDelegate?.goToDetailScreen(DayNhayScreenRouter.setupModule())
        }
    }
}

// MARK: - CountDownScreen ViewProtocol
extension CountDownScreenViewController: CountDownScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
