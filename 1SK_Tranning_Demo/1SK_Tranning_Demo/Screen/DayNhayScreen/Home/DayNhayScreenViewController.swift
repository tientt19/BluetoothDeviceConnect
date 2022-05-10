//
//  
//  DayNhayScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 25/04/2022.
//
//

import UIKit


enum ExerciseTypes: String {
    case nhay_tu_do
    case nhay_hen_gio
    case nhay_dem_nguoc
}

// MARK: - ViewProtocol
protocol DayNhayScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - DayNhayScreen ViewController
class DayNhayScreenViewController: BaseViewController {
    
    var router: DayNhayScreenRouterProtocol!
    var viewModel: DayNhayScreenViewModelProtocol!
    
    @IBOutlet weak var view_DsachBaitap: UIView!
    @IBOutlet weak var tbv_DsachBaiTap: UITableView!
    @IBOutlet weak var view_jumpCycle1: UIView!
    @IBOutlet weak var view_jumpCycle2: UIView!
    @IBOutlet weak var view_parentView: UIView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view_jumpCycle1.layer.masksToBounds = true
        self.view_jumpCycle2.layer.masksToBounds = true
        self.view_jumpCycle1.layer.cornerRadius = view_jumpCycle1.frame.height / 2
        self.view_jumpCycle2.layer.cornerRadius = view_jumpCycle2.frame.height / 2
    }
    
    // MARK: - Init
    private func setupInit() {
        setTbvInit()
        self.view_DsachBaitap.layer.cornerRadius = 20
        self.view_DsachBaitap.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // MARK: - Action
    @IBAction func dismissVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - UITableViewDataSource
extension DayNhayScreenViewController: UITableViewDataSource {

    func setTbvInit(){
        self.view_parentView.backgroundColor = UIColor.init(hex: "0DB3B6")
        self.tbv_DsachBaiTap.delegate = self
        self.tbv_DsachBaiTap.dataSource = self
        self.tbv_DsachBaiTap.separatorStyle = .none
        self.tbv_DsachBaiTap.registerCell(nibName: DsachBaiTapTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: DsachBaiTapTableViewCell.self, forIndexPath: indexPath)
        switch indexPath.item {
        case 0:
            cell.lbl_exerciseName.text = "Nhảy tự do"
        case 1:
            cell.lbl_exerciseName.text = "Nhảy hẹn giờ"
        case 2:
            cell.lbl_exerciseName.text = "Nhảy đếm ngược"
        default:
            break
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension DayNhayScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            self.router.goToCountDownScreen(with: .nhay_tu_do)
        case 1:
            self.router.goToCountDownScreen(with: .nhay_hen_gio)
        case 2:
            self.router.goToCountDownScreen(with: .nhay_dem_nguoc)
        default:
            break
        }
    }
}

// MARK: - DayNhayScreen ViewProtocol
extension DayNhayScreenViewController: DayNhayScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}

extension DayNhayScreenViewController: CountDownResponeProtocol {
    func goToDetailScreen(_ vc: UIViewController, with exerciseType: ExerciseTypes) {
        self.router.goToDayNhayDetailScreen(with: exerciseType)
    }
}
