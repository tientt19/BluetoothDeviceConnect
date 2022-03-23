//
//  BasicChartViewController.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 21/03/2022.
//

import UIKit
import TrusangBluetooth

class BasicChartViewController: UIViewController {
    
    @IBOutlet weak var chart: Chart!
    @IBOutlet weak var multiLineChart : Chart!
    var dataPass = [(x: Double, y: Double)]()
    var bloodPressure = [TrusangBluetooth.ZHJBloodPressureDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chart.delegate = self
        multiLineChart.delegate = self
        self.navigationItem.title = "Basic chart view"
        
        let series = ChartSeries(data: dataPass)
        series.area = true
        chart.xLabels = [0, 4, 8, 12, 16, 20, 24]
        chart.yLabels = [0, 50, 100]
        chart.xLabelsFormatter = { self.timeValueFormatter($1) }
        chart.add(series)
        
        /// Multiline chart
    
        multiLineChart.xLabels = [0, 4, 8, 12, 16, 20, 24]
        multiLineChart.yLabels = [0, 50, 100, 150, 200]
        
        let series1 = ChartSeries(data: convertDBP(bloodPressure))
        series1.area = false
        series1.color = ChartColors.blueColor()
        
        let series2 = ChartSeries(data: convertSBP(bloodPressure))
        series2.area = false
        series2.color = ChartColors.redColor()
                
        multiLineChart.xLabelsFormatter = { self.timeValueFormatter($1) }
        multiLineChart.add([series1,series2])
    }
    
    public func timeValueFormatter(_ value: Double) -> String {
        let timestampValue = Double(round(10 * value) / 10)
        if timestampValue < 10 {
            return "0\(Int(timestampValue)):00"
        } else if timestampValue == 24.00 {
            return "23:59"
        }
        return "\(Int(timestampValue)):00"
    }
}

extension BasicChartViewController {
    func convertDBP(_ data : [TrusangBluetooth.ZHJBloodPressureDetail]) -> [(x: Double, y: Double)]{
        var temp = [(x: Double, y: Double)]()
        for item in data {
            if item.DBP != 0 {
                temp.append((x: Double(self.convertDateString(item.dateTime)), y: Double(item.DBP)))
            }
        }
        return temp
    }
    
    func convertSBP(_ data : [TrusangBluetooth.ZHJBloodPressureDetail]) -> [(x: Double, y: Double)]{
        var temp = [(x: Double, y: Double)]()
        for item in data {
            if item.SBP != 0 {
                temp.append((x: Double(self.convertDateString(item.dateTime)), y: Double(item.SBP)))
            }
        }
        return temp
    }
    
    func convertDateString(_ dateString: String) -> Double {
        // Your original code
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = dateFormatter.date(from: dateString)
        
        // To convert the date into an HH:mm format
        dateFormatter.dateFormat = "HH:mm"
        let dateString = Double(dateFormatter.string(from: date!).replacingOccurrences(of: ":", with: "."))
        return dateString!
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
