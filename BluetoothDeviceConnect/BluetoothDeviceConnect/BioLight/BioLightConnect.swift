//
//  BioLightConnect.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 08/03/2022.
//

import UIKit
import CoreBluetooth

enum Bit: UInt8, CustomStringConvertible {
    case zero, one
    
    var description: String {
        switch self {
        case .one:
            return "1"
        case .zero:
            return "0"
        }
    }
}

class BioLightConnect: UIViewController {
    var centralManager: CBCentralManager!
    var bioLightPeripheral: CBPeripheral!
    var bioCharacteristic: CBCharacteristic? = nil
    var measurementState = false
    
    @IBOutlet weak var statusLabel : UILabel!
    @IBOutlet weak var sysLabel : UILabel!
    @IBOutlet weak var prLabel : UILabel!
    @IBOutlet weak var diaLabel : UILabel!
    @IBOutlet weak var mapLabel : UILabel!
    @IBOutlet weak var errorLabel : UILabel!
    
    var sysValue = Int()
    var diaValue = Int()
    var mapValue = Int()
    var prValue = Int()
    
    let CharacteristicCBUUID1 = CBUUID(string: "FFF4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.text = "None"
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    @IBAction func sendCommanh(_ sender : UIButton) {
//        bioLightPeripheral.writeValue(Data, for: bioCharacteristic, type: .withoutResponse)
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
            if characteristic.uuid == CharacteristicCBUUID1 {
                if characteristic.properties.contains(.read) {
                    peripheral.readValue(for: characteristic)
                }
                
                if characteristic.properties.contains(.write) {
                    print("day la write properties \(characteristic.uuid)")
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
        let id = data.removeFirst()
        let dataSegment = data
        
        switch id {
        case 40:
            measurementState = true
            statusLabel.text = "Measuring"
            guard dataSegment.count > 0 else {
                return
            }
            let sys = dataSegment[0]
            self.sysValue = Int(sys)
            sysLabel.text = "SYS Value : \(sysValue)"
        case 41:
            measurementState = false
            guard dataSegment.count > 0 else {
                return
            }
            
            let errorByte = dataSegment[1]
            if errorByte == 0 {
                let firstByte = dataSegment[0]
                sysValue = turnInt(bits(fromByte: firstByte)[0].rawValue) * 256 + turnInt(dataSegment[2])
                diaValue = turnInt(bits(fromByte: firstByte)[1].rawValue) * 256 + turnInt(dataSegment[3])
                mapValue = turnInt(bits(fromByte: firstByte)[2].rawValue) * 256 + turnInt(dataSegment[4])
                prValue = turnInt(bits(fromByte: firstByte)[3].rawValue) * 256 + turnInt(dataSegment[5])
                sysLabel.text = "SYS Value : \(sysValue)"
                diaLabel.text = "DIA Value : \(diaValue)"
                mapLabel.text = "MAP Value : \(mapValue)"
                prLabel.text = "PR Value : \(prValue)"
            } else {
                if errorByte == 6 || errorByte == 20 {
                    dLogDebug("error device")
                    errorLabel.text = "ERROR : error device"
                } else if errorByte == 11 || errorByte == 13 {
                    dLogDebug("error movement")
                    errorLabel.text = "ERROR : error movement"
                } else if errorByte == 19 {
                    dLogDebug("error timeout")
                    errorLabel.text = "ERROR : error timeout"
                }
            }
            
            guard dataSegment.count > 0 else {
                return
            }
        case 42:
            guard dataSegment.count > 0 else {
                return
            }
            let status = bits(fromByte: dataSegment[0])[4].rawValue
            if status == 0 {
                measurementState = false
                statusLabel.text = "none"
            } else {
                measurementState = true
                statusLabel.text = "measuring"
            }
            print(status)
        default:
            break
        }
    }
}

extension BioLightConnect {
    func bits(fromByte byte: UInt8) -> [Bit] {
        var byte = byte
        var bits = [Bit](repeating: .zero, count: 8)
        for i in 0..<8 {
            let currentBit = byte & 0x01
            if currentBit != 0 {
                bits[i] = .one
            }
            
            byte >>= 1
        }
        
        return bits
    }
    
    func turnInt(_ x : UInt8) -> Int {
        return Int(x)
    }
}
