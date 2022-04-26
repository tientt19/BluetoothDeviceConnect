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
    
    func dayNhayNavigationView() {
        UINavigationBar.appearance().tintColor = .black
        self.navigationController?.navigationBar.update(backroundColor: .white, titleColor: .black)
    }
    
    func setUpShadow() {
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 1
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.navigationController?.navigationBar.layer.shadowRadius = 4
    }

    func showProgressHud() { }
    func hideProgressHud() { }
}
