//
//  
//  MessagesScreenViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol MessagesScreenViewProtocol: AnyObject {
    func showHud()
    func hideHud()
}

// MARK: - MessagesScreen ViewController
class MessagesScreenViewController: BaseViewController {
    var router: MessagesScreenRouterProtocol!
    var viewModel: MessagesScreenViewModelProtocol!
    
    @IBOutlet weak var exerciseInfoTableView : UITableView!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.viewModel.onViewDidLoad()
    }
    
    // MARK: - Init
    private func setupInit() {
        exerciseInfoTableView.registerCell(nibName: CustomCell.self)
        exerciseInfoTableView.registerCell(nibName: CustomHeader.self)
        exerciseInfoTableView.separatorStyle = .none
        exerciseInfoTableView.contentInset = UIEdgeInsets(top: -48, left: 0, bottom: 0, right: 0)
        exerciseInfoTableView.estimatedRowHeight = 439
        exerciseInfoTableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Action

}

extension MessagesScreenViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MessagesScreenViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeue(cellClass: CustomCell.self, forIndexPath: indexPath)
            return cell
        } else {
            let cell = tableView.dequeue(cellClass: CustomHeader.self, forIndexPath: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil }

        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 24))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 16, y: 0, width: headerView.frame.width, height: 24)
        label.text = "Thông tin bài tập"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 32
    }
}

// MARK: - MessagesScreen ViewProtocol
extension MessagesScreenViewController: MessagesScreenViewProtocol {
    func showHud() {
        self.showProgressHud()
    }
    
    func hideHud() {
        self.hideProgressHud()
    }
}
