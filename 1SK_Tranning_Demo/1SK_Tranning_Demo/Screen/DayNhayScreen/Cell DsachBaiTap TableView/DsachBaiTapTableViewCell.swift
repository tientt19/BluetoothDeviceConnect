//
//  DsachBaiTapTableViewCell.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 25/04/2022.
//

import UIKit

class DsachBaiTapTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
