//
//  CellResultTableViewCellBody.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//

import UIKit

class CellResultTableViewCellBody: UITableViewCell {
    
    @IBOutlet weak var clv_ResultCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setInitCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CellResultTableViewCellBody: UICollectionViewDataSource {

    func setInitCollection() {
        self.selectionStyle = .none
        self.clv_ResultCollectionView.dataSource = self
        self.clv_ResultCollectionView.delegate = self
        self.clv_ResultCollectionView.registerCell(nibName: CellResultColletionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeue(cellClass: CellResultColletionViewCell.self, forIndexPath: indexPath)
        return cell
    }
}

extension CellResultTableViewCellBody: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 106, height: 98)
    }
}

extension CellResultTableViewCellBody: UICollectionViewDelegate {
    
}
