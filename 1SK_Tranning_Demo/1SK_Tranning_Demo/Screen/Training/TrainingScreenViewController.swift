//
//  
//  TrainingScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol TrainingScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - TrainingScreen ViewController
class TrainingScreenViewController: BaseViewController {
    var router: TrainingScreenRouterProtocol!
    var viewModel: TrainingScreenViewModelProtocol!
    @IBOutlet weak var tableView : UITableView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    // MARK: - Init
    private func setupInit() {
        self.navigationItem.title = "Đạp xe trong nhà"
        tableView.registerCell(nibName: TrainingTableViewCell.self)
        tableView.separatorStyle = .none
    }
    
    // MARK: - Action
}

extension TrainingScreenViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router.openDetail()
    }
}
extension TrainingScreenViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: TrainingTableViewCell.self, forIndexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 246
    }
}


// MARK: - TrainingScreen ViewProtocol
extension TrainingScreenViewController: TrainingScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
