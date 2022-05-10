//
//  AlertTimePickerView.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 10/05/2022.
//

import UIKit

class AlertTimePickerView: UIViewController {
    
    @IBOutlet weak var tbv_timePicker: UITableView!
    @IBOutlet weak var view_coverView: UIView!
    
    let listString = ["30s","1 phút", "2 phút","3 phút","5 phút","10 phút","Tuỳ chỉnh"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setInit()
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showAnimate()  
    }
}

extension AlertTimePickerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell = tableView.cellForRow(at: indexPath) as! CellTableViewTimePicker
        if selectedCell.lbl_timeLimit.text == "Tuỳ chỉnh" {
            let controller = AlertInputTime()
            controller.delegate = self
            controller.modalPresentationStyle = .custom
            
            self.present(controller, animated: false) {
                self.view_coverView.isHidden = true
            }
        }
    }
}

extension AlertTimePickerView: UITableViewDataSource {
    
    private func setInit() {
        self.tbv_timePicker.registerCell(nibName: CellTableViewTimePicker.self)
        self.tbv_timePicker.delegate = self
        self.tbv_timePicker.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: CellTableViewTimePicker.self, forIndexPath: indexPath)
        cell.lbl_timeLimit.text = self.listString[indexPath.row]
        return cell
    }
}

extension AlertTimePickerView: HidePreviousViewProtocols {
    func dismissView() {
        self.dismiss(animated: false)
    }
    
    func hideView() {
        self.view_coverView.isHidden = false
    }
}

// MARK: - Init Animation
extension AlertTimePickerView {
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0
        
        UIView.animate(withDuration: 0.35, animations: { () -> Void in
            self.view.alpha = 1
            self.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    func hiddenAnimate() {
        UIView.animate(withDuration: 0.35, animations: { () -> Void in
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0
            self.view.layoutIfNeeded()
            
        }, completion: { (finished) -> Void in
            self.dismiss(animated: false, completion: nil)
        })
    }
}
