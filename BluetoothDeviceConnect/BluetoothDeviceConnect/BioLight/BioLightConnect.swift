//
//  BioLightConnect.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 08/03/2022.
//

import UIKit
import CoreBluetooth

class DataBlock {
    var id : UInt8
    var dataSegment : [UInt8]
    
    init(id : UInt8, dataSegment: [UInt8]) {
        self.id = id
        self.dataSegment = dataSegment
    }
    
    func handleWithId(with id : UInt8) {
        switch id {
        case 40:
            dLogDebug(dataSegment)
        case 41:
            dLogDebug(dataSegment)
        case 42:
            _ = ""
        case 43:
            _ = ""
        case 44:
            _ = ""
        case 45:
            _ = ""
        case 47:
            _ = ""
        case 48:
            _ = ""
        case 49:
            _ = ""
        case 50:
            _ = ""
        default:
            dLogDebug("error")
        }
    }
}

class BioLightConnect: UIViewController {
    var centralManager: CBCentralManager!
    var bioLightPeripheral: CBPeripheral!
    
    let CharacteristicCBUUID1 = CBUUID(string: "FFF4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

//MARK: - CBCentralManagerDelegate
extension BioLightConnect: CBCentralManagerDelegate {
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
        
        if peripheral.name == "AL_WBP" {
            bioLightPeripheral = peripheral
            bioLightPeripheral.delegate = self
            centralManager.stopScan()
            centralManager.connect(bioLightPeripheral)
        }
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Sau khi connect thi tim service
        bioLightPeripheral.discoverServices(nil)
    }
}

//MARK: - CBPeripheralDelegate
extension BioLightConnect: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        
        for service in services {
            print("Day la services \(service)")
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        
        for characteristic in characteristics {
            //            print("day la characteristic.uuid is \(characteristic.uuid)")
            if characteristic.uuid == CharacteristicCBUUID1 {
                if characteristic.properties.contains(.read) {
                    peripheral.readValue(for: characteristic)
                }
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
            if let dataResposne = characteristic.value {
                let dataa = [UInt8](dataResposne)
                handePacketReceive(data: dataa)
            }
        default:
            print("Unhandled Characteristic UUID: \(characteristic.uuid)")
        }
    }
}

extension BioLightConnect {
    func handePacketReceive(data : [UInt8]) {
        var `data` = data
        _ = data.removeFirst()
        _ = data.removeLast()
        _ = data.removeFirst()
        let dataBlock = DataBlock(id: data.removeFirst(), dataSegment: data)
        dataBlock.handleWithId(with: dataBlock.id)
    }
}
