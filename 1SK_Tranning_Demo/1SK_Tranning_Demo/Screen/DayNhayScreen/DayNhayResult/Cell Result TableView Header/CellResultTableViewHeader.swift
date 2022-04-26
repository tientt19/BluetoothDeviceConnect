//
//  CellResultTableViewHeader.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 26/04/2022.
//

import UIKit

class CellResultTableViewHeader: UITableViewCell {
    
    @IBOutlet weak var view_jumpCycle1: UIView!
    @IBOutlet weak var view_jumpCycle2: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view_jumpCycle1.layer.masksToBounds = true
        view_jumpCycle2.layer.masksToBounds = true
        view_jumpCycle1.layer.cornerRadius = view_jumpCycle1.frame.height / 2
        view_jumpCycle2.layer.cornerRadius = view_jumpCycle2.frame.height / 2
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
