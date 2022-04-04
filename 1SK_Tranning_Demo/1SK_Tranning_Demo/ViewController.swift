//
//  ViewController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = MainTabBarController()
        tabbar.modalPresentationStyle = .fullScreen
        present(tabbar, animated: true, completion: nil)
    }
}
