//
//  ViewController.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 07/03/2022.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    @IBOutlet weak var dataTableView : UITableView!
    
    var centralManager: CBCentralManager!
    var heartRatePeripheral: CBPeripheral!
    
    let CharacteristicCBUUID2 = CBUUID(string: "FFF1")
    let CharacteristicCBUUID1 = CBUUID(string: "FFF4")
    
    var holdData = [CGFloat]()
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        dataTableView.registerCell(nibName: tableviewCellTableViewCell.self)
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holdData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: tableviewCellTableViewCell.self, forIndexPath: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]  + ": \(holdData[indexPath.row])"
        return cell
    }
}

//MARK: - CBCentralManagerDelegate

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("central.state is .unknown")
        case .resetting:
            print("central.state is .resetting")
        case .unsupported:
            print("central.state is .unsupported")
        case .unauthorized:
            print("central.state is .unauthorized")
        case .poweredOff:
            print("central.state is .poweredOff")
        case .poweredOn:
            print("central.state is .poweredOn")
            // khi bluetooth dc bat thi scan thiet bi
            centralManager.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if peripheral.name == "1SK-SmartScale68" {
            heartRatePeripheral = peripheral
            heartRatePeripheral.delegate = self
            centralManager.stopScan()
            centralManager.connect(heartRatePeripheral)
        }
        // Sau khi tim dc thiet bi thi stop scanning va connect den no
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Sau khi connect thi tim service
        heartRatePeripheral.discoverServices(nil)
    }
}

//MARK: - CBPeripheralDelegate
extension ViewController: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        
        for service in services {
            print("Day la service \(service)")
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        
        for characteristic in characteristics {
            print("day la characteristic.uuid is \(characteristic.uuid)")
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
            
            // thong bao neu gia tri thay doi
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        switch characteristic.uuid {
        case CharacteristicCBUUID1:
            if let xx = characteristic.value {
                let dataa = [UInt8](xx)
                print(dataa)
                if dataa.count >= 11 {
                    if dataa[9] == 0 {
                        convertData(from: dataa)
                    }
                }
            }
        default:
            print("Unhandled Characteristic UUID: \(characteristic.uuid)")
        }
    }
}


extension ViewController {
    private func convertData(from chaValue: [UInt8]) {
        let htBodyFat = HTBodyfat_NewSDK()
        
        let weightUnit : String = {
            var unit = String()
            if chaValue[8] == 0 {
                unit = "KG"
            }
            return unit
        }()
        
        let weightFloat : Float = {
            var weight = Float()
            let convert = Float(chaValue[4])*256 + Float(chaValue[3])
            weight = Float(convert) * 0.01
            return weight
        }()
        
        let impedance = (Float(chaValue[2]) * 256 + Float(chaValue[1]))
        
        htBodyFat.getBodyfatWithweightKg(CGFloat(weightFloat), heightCm: 172, sex: THTSexType(rawValue: 1)!, age: 24, impedance: Int(impedance))
        
        
        self.titleArray = ["htBodyFat.thtBMI",
                           "CGFloat(htBodyFat.thtBM",
                           "htBodyFat.thtMuscleKg",
                           "htBodyFat.thtBoneK)",
                           "htBodyFat.thtWaterPercentage",
                           "htBodyFat.thtproteinPercentage",
                           "htBodyFat.thtBodyfatPercentage",
                           "CGFloat(htBodyFat.thtVFAL)",
                           "htBodyFat.thtBodySMuscleControl",
                           "CGFloat(weightFloat)"]
        self.holdData = [htBodyFat.thtBMI,
                         CGFloat(htBodyFat.thtBMR),
                         htBodyFat.thtMuscleKg,
                         htBodyFat.thtBoneKg,
                         htBodyFat.thtWaterPercentage,
                         htBodyFat.thtproteinPercentage,
                         htBodyFat.thtBodyfatPercentage,
                         CGFloat(htBodyFat.thtVFAL),
                         htBodyFat.thtBodySMuscleControl,
                         CGFloat(weightFloat)]
        DispatchQueue.main.async {
            self.dataTableView.reloadData()
        }
        print("\(weightFloat)\(weightUnit)")
    }
}
