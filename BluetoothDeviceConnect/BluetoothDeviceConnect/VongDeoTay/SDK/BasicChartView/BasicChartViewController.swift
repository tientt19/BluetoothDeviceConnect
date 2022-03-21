//
//  BasicChartViewController.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 21/03/2022.
//

import UIKit

class BasicChartViewController: UIViewController {
    
    @IBOutlet weak var chart: Chart!
    var dataPass = [(x: Double, y: Double)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chart.delegate = self
        self.navigationItem.title = "Basic chart view"
        
        let series = ChartSeries(data: dataPass)
        series.area = true
        chart.xLabels = [0, 4, 8, 12, 16, 20, 24]
        chart.yLabels = [0, 50, 100]
        chart.xLabelsFormatter = { String(Int(round($1))) + ":00"}
        chart.add(series)
    }
    
    func hmsFrom(seconds: Int, completion: @escaping (_ hours: Int, _ minutes: Int)->()) {
        completion(seconds / 3600, (seconds % 3600) / 60)
    }
    
    func getStringFrom(seconds: Int) -> String {
        return seconds < 10 ? "0\(seconds)" : "\(seconds)"
    }
    
    
}

extension BasicChartViewController : ChartDelegate {
    func didTouchChart(_ chart: Chart, indexes: [Int?], x: Double, left: CGFloat) {
        for (seriesIndex, dataIndex) in indexes.enumerated() {
            if let _ = chart.valueForSeries(seriesIndex, atIndex: dataIndex) {

            }
        }
    }
    
    func didFinishTouchingChart(_ chart: Chart) {
        
    }
    
    func didEndTouchingChart(_ chart: Chart) {
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        // Redraw chart on rotation
        chart.setNeedsDisplay()
        
    }
    
}
