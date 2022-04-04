//
//  BaseViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    

    func showProgressHud() { }
    func hideProgressHud() { }
}
