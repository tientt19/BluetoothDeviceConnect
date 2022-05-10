//
//  CellTableViewTimePicker.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 10/05/2022.
//

import UIKit

class CellTableViewTimePicker: UITableViewCell {
    
    @IBOutlet weak var view_buttonView: UIView!
    @IBOutlet weak var bt_chooseButton: UIButton!
    @IBOutlet weak var lbl_timeLimit: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
