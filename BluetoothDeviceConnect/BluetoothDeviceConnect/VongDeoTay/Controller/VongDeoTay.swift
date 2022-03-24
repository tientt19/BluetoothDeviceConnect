//
//  VongDeoTay.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 21/03/2022.
//

import UIKit
import TrusangBluetooth
import CoreBluetooth

class VongDeoTay: UIViewController {
    
    @IBOutlet weak var getRecordData : UIButton!
    @IBOutlet weak var sleepDataButton : UIButton!
    
    let sdkConnect = ZHJBLEManagerProvider.shared
    var deviceConnected = TrusangBluetooth.ZHJBTDevice()
    let bloodPressureDataCall = ZHJHR_BP_BOProcessor()
    let stepDataCall = ZHJStepAndSleepProcessor()
    let bodyTemp = ZHJTemperatureProcessor()
    var tempChar : CBCharacteristic? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        determineState()
    }
    

    @IBAction func testTap(_ sender: UIButton) {
        
        /// lay data bloodpressure de hien thi bieu do
        bloodPressureDataCall.readHR_BP_BOHistoryRecord(getCurrentDate()) { heartRate, bloodPressure, bloodOxygen in
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BasicChartViewController") as? BasicChartViewController
            vc?.dataPass = self.getDataViaTime(bloodOxygen.details)
            vc?.bloodPressure = bloodPressure.details
            self.navigationController?.pushViewController(vc!, animated: true)
        } historyDoneHandle: { result in
            dLogDebug(result)
        }
    }
    
    @IBAction func sleepDataChart(_ sender : UIButton) {
        
        /// lay data de hien thi bieu do
        stepDataCall.readStepAndSleepHistoryRecord(date: getCurrentDate()) { stepData, sleepData in
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SleepDataChart") as? StepDataChart
            vc?.dataPass = stepData.details
            for item in sleepData.details {
                dLogDebug(item.duration)
                dLogDebug(item.dateTime)
            }
            
            dLogDebug(sleepData.REMDuration)
            dLogDebug(sleepData.deepDuration)
            dLogDebug(sleepData.awakeDuration)
            dLogDebug(sleepData.beginDuration)
            
            self.navigationController?.pushViewController(vc!, animated: true)
        } historyDoneHandle: { result in
            dLogDebug(result)
        }
    }
    
    func getDataViaTime(_ data : [TrusangBluetooth.ZHJBloodOxygenDetail]) -> [(x: Double, y: Double)] {
        var temp = [(x: Double, y: Double)]()
        for item in data {
            if item.BO != 0 {
                temp.append((x: Double(self.convertDateString(item.dateTime)), y: Double(item.BO)))
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
    
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let now = Date()
        let dateString = formatter.string(from: now)
        return dateString
    }
}

extension VongDeoTay {
    //MARK: -- Determine Bluetooth status
    func determineState() {
        sdkConnect.bluetoothProviderManagerStateDidUpdate { [weak self] status in
            guard let `self` = self else { return }
            self.searchDevice()
        }
    }
    
    //MARK: -- Search Devices
    func searchDevice() {
        sdkConnect.scan { devices in
            for item in devices {
                if item.name == "S5-D891" {
                    self.deviceConnected = item
                    self.connect()
                }
                self.sdkConnect.stopScan()
            }
        }
    }
    
    //MARK: -- Connect device
    func connect() {
        sdkConnect.connectDevice(device: self.deviceConnected) { [weak self] device in
            guard let `self` = self else { return }
            print("device is connected")
            
            self.getRecordData.isHidden = false
            self.sleepDataButton.isHidden = false
            
            self.sdkConnect.discoverWriteCharacteristic { writeChar in
                self.tempChar = writeChar
            }
            
            self.sdkConnect.discoverReadCharacteristic { readChar in
            }
            
        } fail: { device, error in
            dLogDebug(error as Any)
        } timeout: {
            dLogDebug("time out!!!")
        }
    }
}

