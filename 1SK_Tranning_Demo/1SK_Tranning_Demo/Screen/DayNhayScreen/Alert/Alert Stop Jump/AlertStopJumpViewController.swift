//
//  AlertStopJumpViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 10/05/2022.
//

import UIKit

protocol ComfirmStopProtocol: AnyObject {
    func confirm()
}

class AlertStopJumpViewController: UIViewController {
    
    var confirmDelegate: ComfirmStopProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func confirmStop(_ sender: UIButton) {
        self.dismiss(animated: false) {
            self.confirmDelegate.confirm()
        }
    }

    @IBAction func cancelStop(_ sender: UIButton) {
        self.dismiss(animated: false)
    }

}
