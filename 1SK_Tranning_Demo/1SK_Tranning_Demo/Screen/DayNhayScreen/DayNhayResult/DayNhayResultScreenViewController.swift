//
//  
//  DayNhayResultScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol DayNhayResultScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - DayNhayResultScreen ViewController
class DayNhayResultScreenViewController: BaseViewController {
    var router: DayNhayResultScreenRouterProtocol!
    var viewModel: DayNhayResultScreenViewModelProtocol!
    
    @IBOutlet weak var tbv_Result: UITableView!
    @IBOutlet weak var view_jumpCycle1: UIView!
    @IBOutlet weak var view_jumpCycle2: UIView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    // MARK: - Init
    private func setupInit() {
        setInitTavleView()
    }
    
    // MARK: - Action
    @IBAction func onDismissVC(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DayNhayResultScreenViewController: UITableViewDataSource {

    func setInitTavleView() {
        tbv_Result.registerCell(nibName: CellResultTableViewHeader.self)
        tbv_Result.registerCell(nibName: CellResultTableViewCellBody.self)
        tbv_Result.registerCell(nibName: CellResultTableViewFooter.self)

        tbv_Result.dataSource = self
        tbv_Result.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(cellClass: CellResultTableViewHeader.self, forIndexPath: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeue(cellClass: CellResultTableViewCellBody.self, forIndexPath: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeue(cellClass: CellResultTableViewFooter.self, forIndexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension DayNhayResultScreenViewController: UITableViewDelegate {
    
}
// MARK: - DayNhayResultScreen ViewProtocol
extension DayNhayResultScreenViewController: DayNhayResultScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
