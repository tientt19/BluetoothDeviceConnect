//
//  ViewController.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 07/03/2022.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    var centralManager: CBCentralManager!
    var heartRatePeripheral: CBPeripheral!
    
    let CharacteristicCBUUID2 = CBUUID(string: "FFF1")
    let CharacteristicCBUUID1 = CBUUID(string: "FFF4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

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
            print("day la cccc is \(characteristic.uuid)")
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
                print(dataa[4])
                print(dataa[5])
                let htBodyFat = HTBodyfat_NewSDK()
            }
        default:
            print("Unhandled Characteristic UUID: \(characteristic.uuid)")
        }
    }
}


extension ViewController {
    private func heartRate(from characteristic: [UInt8]) -> Int {
        return 0
    }
}



