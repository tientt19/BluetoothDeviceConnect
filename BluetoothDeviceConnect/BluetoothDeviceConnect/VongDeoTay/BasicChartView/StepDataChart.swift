//
//  SleepDataChart.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 22/03/2022.
//

import UIKit
import TrusangBluetooth

class StepDataChart: UIViewController{
    
    @IBOutlet weak var chart : BarChartView!
    @IBOutlet weak var sleepChart : UIView!

    var sampleData = SleepSampleData()
    
    var dataPass = [TrusangBluetooth.ZHJStepDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Bar Chart View"
        setUpBarChartData()
        setupBarChartView()
        setUpSleepViewData()
    }
}

extension StepDataChart: ChartViewDelegate {
    
}

extension StepDataChart {
    private func setupBarChartView() {
        chart.delegate = self
        
        chart.drawBarShadowEnabled = false
        chart.drawValueAboveBarEnabled = false
        chart.doubleTapToZoomEnabled = false
        chart.setScaleEnabled(false)
        chart.legend.enabled = false
        
        // yAxis
        let yAxis = chart.leftAxis
        yAxis.labelTextColor = UIColor(hex: "737678")
        yAxis.axisLineColor = UIColor(hex: "D3DFE8")
        yAxis.gridColor = UIColor(hex: "D3DFE8")
        yAxis.labelPosition = .outsideChart
        yAxis.spaceTop = 0.15
        yAxis.axisMinimum = 0
        
        let yAxisRight = chart.rightAxis
        yAxisRight.labelTextColor = .clear
        yAxisRight.axisLineColor = .clear
        yAxisRight.gridColor = .clear
        
        let xAxis = chart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = UIColor(hex: "737678")
        xAxis.axisLineColor = UIColor(hex: "D3DFE8")
        xAxis.gridColor = UIColor(hex: "D3DFE8")
        xAxis.setLabelCount(7, force: true)
        xAxis.valueFormatter = TimeValueFormatter()
        xAxis.axisMinimum = Date().startOfDay.timeIntervalSince1970
        xAxis.axisMaximum = Date().endOfDay.timeIntervalSince1970
        xAxis.granularity = 3600 * 24
        chart.setVisibleXRange(minXRange: 24 * 3600, maxXRange: 24 * 3600)
        xAxis.avoidFirstLastClippingEnabled = false
        
        chart.xAxis.enabled = true
        chart.chartDescription.enabled = false
        chart.dragEnabled = true
        chart.setScaleEnabled(true)
        chart.pinchZoomEnabled = false
    }
    
}

extension StepDataChart {
    
    private func setUpSleepViewData() {
        sleepChart.backgroundColor = UIColor(hex: "914FC5")
        var views = [UIView]()
        let prarentWidth = sleepChart.frame.width
        for i in 0...self.sampleData.data.count - 1 {
            views.append(UIView())
            switch self.sampleData.data[i].type {
            case .asleep:
                views[i].backgroundColor = UIColor(hex: "FEC63D")
            case .light:
                views[i].backgroundColor = UIColor(hex: "914FC5")
            case .deep:
                views[i].backgroundColor = UIColor(hex: "54399F")
            case .rem:
                views[i].backgroundColor = UIColor(hex: "4CD864")
            }
            
            if i == 0 {
                self.sleepChart.addSubview(views[0])
                NSLayoutConstraint.activate([
                    views[0].topAnchor.constraint(equalTo: self.sleepChart.topAnchor),
                    views[0].leftAnchor.constraint(equalTo: self.sleepChart.leftAnchor),
                    views[0].bottomAnchor.constraint(equalTo: self.sleepChart.bottomAnchor),
                    views[0].widthAnchor.constraint(equalToConstant: prarentWidth / Double(self.sampleData.data.count)),
                ])
                
            } else {
                self.sleepChart.addSubview(views[i])
                NSLayoutConstraint.activate([
                    views[i].topAnchor.constraint(equalTo: self.sleepChart.topAnchor),
                    views[i].leftAnchor.constraint(equalTo: views[i-1].rightAnchor),
                    views[i].bottomAnchor.constraint(equalTo: self.sleepChart.bottomAnchor),
                    views[i].widthAnchor.constraint(equalToConstant: prarentWidth / Double(self.sampleData.data.count)),
                ])
            }
        }
    }
    
    private func setUpBarChartData() {
        var stepChartDataValues: [BarChartDataEntry] = []
        
        for i in 0 ... dataPass.count - 1{
            let value = dataPass[i].step
            let chartData = BarChartDataEntry(x: Double(i * 600) + Date().startOfDay.timeIntervalSince1970, y: Double(value))
            stepChartDataValues.append(chartData)
        }
        self.chart.data = setUpBarChartData(with: stepChartDataValues)
    }
    
    private func setUpBarChartData(with dataEntry: [BarChartDataEntry]) -> BarChartData {
        var set: BarChartDataSet
        set = BarChartDataSet(entries: dataEntry, label: "")
        set.colors = [UIColor(hex: "00C2C5")]
        let dataSet = BarChartData(dataSet: set)
        dataSet.barWidth = 300
        self.chart.setVisibleXRangeMaximum(3)
        return dataSet
    }
}

extension UIColor {
    convenience init(hex: String) {
        var rgbString = hex
        if rgbString.hasPrefix("#") {
            rgbString.removeFirst()
        }
        rgbString = rgbString.capitalized
        var rgb: UInt64 = 0
        Scanner(string: rgbString).scanHexInt64(&rgb)
        self.init(rgb: rgb, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        var rgbString = hex
        if rgbString.hasPrefix("#") {
            rgbString.removeFirst()
        }
        var rgb: UInt64 = 0
        Scanner(string: rgbString).scanHexInt64(&rgb)
        self.init(rgb: rgb, alpha: alpha)
    }
    
    convenience init(rgb: UInt64, alpha: CGFloat) {
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: alpha
        )
    }
}

public class TimeValueFormatter: NSObject, AxisValueFormatter {
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        var timestampValue = Double(round(10 * value) / 10)
        if timestampValue == Date().nextDay.timeIntervalSince1970 {
            timestampValue = value - 60
        }
        
        let date = Date(timeIntervalSince1970: timestampValue)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(for: date) ?? ""
    }
}

extension Date {
    var startOfWeek1: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    var endOfWeek1: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
}

public class DayValueFormatter: NSObject, AxisValueFormatter {
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let date = Date(timeIntervalSince1970: value)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        
        return formatter.string(for: date) ?? ""
    }
}
