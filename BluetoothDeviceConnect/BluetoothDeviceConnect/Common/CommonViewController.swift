//
//  CommonViewController.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 24/03/2022.
//

import UIKit

class CommonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func smartScaleConnection(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func bioLightConnect(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BioLightConnect") as? BioLightConnect
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func s5_smartWatch(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "VongDeoTay") as? VongDeoTay
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func xe_dap(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "XeDap") as? XeDap
        self.navigationController?.pushViewController(vc!, animated: true)
    }


}
