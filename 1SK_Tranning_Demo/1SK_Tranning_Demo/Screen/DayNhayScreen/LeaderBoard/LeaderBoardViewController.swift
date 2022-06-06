//
//  
//  LeaderBoardViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 06/06/2022.
//
//

import UIKit

// MARK: - ViewProtocol
protocol LeaderBoardViewProtocol: AnyObject {

}

// MARK: - LeaderBoard ViewController
class LeaderBoardViewController: BaseViewController {
    var router: LeaderBoardRouterProtocol!
    var viewModel: LeaderBoardViewModelProtocol!
    @IBOutlet weak var tbv_leaderBoard: UITableView!
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupInit()
        self.setInitTableView()
        self.viewModel.onViewDidLoad()
    }
    
    // MARK: - Init
    private func setupInit() {
        self.title = "Thành tích của tôi"
    }
    
    // MARK: - Action
    
}

// MARK: - UITableViewDataSource
extension LeaderBoardViewController: UITableViewDataSource {
    func setInitTableView() {
        self.tbv_leaderBoard.registerCell(nibName: CellTableViewStatisticalLeaderBoard.self)
        self.tbv_leaderBoard.registerCell(nibName: CellTableViewRankingLeaderBoard.self)
        
        self.tbv_leaderBoard.delegate = self
        self.tbv_leaderBoard.dataSource = self
        self.tbv_leaderBoard.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeue(cellClass: CellTableViewStatisticalLeaderBoard.self, forIndexPath: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeue(cellClass: CellTableViewRankingLeaderBoard.self, forIndexPath: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension LeaderBoardViewController: UITableViewDelegate {

}
 
// MARK: - LeaderBoard ViewProtocol
extension LeaderBoardViewController: LeaderBoardViewProtocol {

}
