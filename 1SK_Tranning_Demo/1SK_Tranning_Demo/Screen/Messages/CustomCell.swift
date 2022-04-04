//
//  CustomCell.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 03/04/2022.
//

import UIKit
import TagListView

protocol dismissVCDelegate : AnyObject  {
    func dismissVC()
}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var tagView : TagListView!
    var cellDelegate : dismissVCDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        tagView.textFont = UIFont.systemFont(ofSize: 14)
        tagView.addTags(["20:00", "MỨC ĐỘ DỄ", "GIẢM BÉO", "GIẢM STRESS","GIẢM STRESS","GIẢM STRESS"])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func dismissVC(_ sender : UIButton) {
        cellDelegate?.dismissVC()
    }
    
}
