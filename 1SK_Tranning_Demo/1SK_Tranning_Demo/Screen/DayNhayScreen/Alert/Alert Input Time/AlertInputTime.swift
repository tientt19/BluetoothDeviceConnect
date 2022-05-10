//
//  AlertInputTime.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 10/05/2022.
//

import UIKit

protocol HidePreviousViewProtocols: AnyObject {
    func hideView()
    func dismissView()
}

class AlertInputTime: UIViewController {
    
    @IBOutlet weak var tf_textField: UITextField!
    @IBOutlet weak var lbl_forceFillInfo: UILabel!
    @IBOutlet weak var view_coverView: UIView!
    
    var delegate: HidePreviousViewProtocols!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        self.tf_textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let _ = textField.text {
            
        }
    }
    
    @IBAction func confirmTap(_ sender: UIButton) {
        if self.tf_textField.text == "" {
            self.lbl_forceFillInfo.isHidden = false
        } else {
            self.lbl_forceFillInfo.isHidden = true
        }
    }

    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: false) {
            self.delegate.dismissView()
        }
    }
    
    @IBAction func popToViewController(_ sender: UIButton) {
        self.dismiss(animated: false) {
            self.delegate.hideView()
        }
    }
}
