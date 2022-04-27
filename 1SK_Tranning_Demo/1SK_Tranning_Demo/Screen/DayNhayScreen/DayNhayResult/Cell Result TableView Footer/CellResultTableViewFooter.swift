//
//  CellResultTableViewFooter.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//

import UIKit

class CellResultTableViewFooter: UITableViewCell {
    
    @IBOutlet weak var tbv_resultTableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTbvInit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: - UITableViewDataSource
extension CellResultTableViewFooter: UITableViewDataSource {

    func setTbvInit(){
        self.tbv_resultTableView.delegate = self
        self.tbv_resultTableView.dataSource = self
        self.tbv_resultTableView.separatorStyle = .none
        self.tbv_resultTableView.registerCell(nibName: CellResultTBV.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: CellResultTBV.self, forIndexPath: indexPath)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CellResultTableViewFooter: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 10 * 54
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
