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
    var exerciseType: ExerciseTypes!
    
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
        self.title = self.exerciseType.rawValue
        self.dayNhayNavigationView()
        self.setUpShadow()
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "bell_image"), style: .done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        self.view_jumpCycle1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onOpenAlertView)))
        
        switch self.exerciseType.rawValue {
        case "nhay_tu_do":
            view_jumpCycle1.backgroundColor = UIColor(hex: "F1FAEA")
            view_jumpCycle2.backgroundColor = UIColor(hex: "81C24B")
        case "nhay_hen_gio":
            view_jumpCycle1.backgroundColor = UIColor(hex: "FFFAE9")
            view_jumpCycle2.backgroundColor = UIColor(hex: "FEB11A")
        case "nhay_dem_nguoc":
            view_jumpCycle1.backgroundColor = UIColor(hex: "E3E6FE")
            view_jumpCycle2.backgroundColor = UIColor(hex: "7065F3")
        default:
            break
        }
    }
    
    // MARK: - Action
    
    @IBAction func onCompleteTap(_ sender: UIButton) {
        let controller = AlertStopJumpViewController()
        controller.modalPresentationStyle = .custom
        controller.confirmDelegate = self
        self.present(controller, animated: false, completion: nil)
    }
    
    @objc func onOpenAlertView() {
        let controller = AlertTimePickerView()
        controller.modalPresentationStyle = .custom
        self.navigationController?.present(controller, animated: false)
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

extension DayNhayDetailScreenViewController: ComfirmStopProtocol {
    func confirm() {
        router.goToResultScreen()
    }
}
