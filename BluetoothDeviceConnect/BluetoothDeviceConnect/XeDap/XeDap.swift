//
//  XeDap.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 24/03/2022.
//

import UIKit
import CoreBluetooth
import FitnessUnits

class XeDap: UIViewController {
    
    private let char2ACC = CBUUID(string: "2ACC")
    private let char2AD3 = CBUUID(string: "2AD3")
    private let char2AD4 = CBUUID(string: "2AD4")
    private let char2AD6 = CBUUID(string: "2AD6")
    private let char2AD8 = CBUUID(string: "2AD8")
    private let charFFF1 = CBUUID(string: "FFF1")
    private let charFFF2 = CBUUID(string: "FFF2")
    private let char2ADA = CBUUID(string: "2ADA")
    
    private let char2AD2 = CBUUID(string: "2AD2")
    private let charFFF5 = CBUUID(string: "FFF5")
    private let charFFF4 = CBUUID(string: "FFF4")
    
    private let unknowCharCBUUID = CBUUID(string: "D18D2C10-C44C-11E8-A355-529269FB1459")
    
    @IBOutlet weak var averageSpeed : UILabel!
    @IBOutlet weak var instantaneousSpeed : UILabel!
    @IBOutlet weak var averageCadence : UILabel!
    @IBOutlet weak var totalDistance : UILabel!
    @IBOutlet weak var resistanceLevel : UILabel!
    @IBOutlet weak var instantaneousPower : UILabel!
    @IBOutlet weak var averagePower : UILabel!
    @IBOutlet weak var energy : UILabel!
    @IBOutlet weak var heartRate : UILabel!
    
    var centralManager: CBCentralManager!
    var weightPeripheral: CBPeripheral!
    let indexName = ["BMI","BMR","Cơ", "Xương","Nước","Protein","Mỡ","Mỡ nội tạng","Khối lượng cơ thể săn chắc(kg)"]
    var indexData = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCentralManager()
    }
    
    func setUpCentralManager() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func onHeartRateReceived(_ heartRate: Int) {
        
    }
}

extension XeDap: CBCentralManagerDelegate {
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
            self.centralManager.scanForPeripherals(withServices: nil)
            
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if peripheral.name == "YESOUL2803083" {
            weightPeripheral = peripheral
            centralManager.stopScan()
            centralManager.connect(weightPeripheral)
            weightPeripheral.delegate = self
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Connected!")
        weightPeripheral.discoverServices(nil)
    }
    
}


extension XeDap: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        for service in services {
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else {return}
        for characteristics in characteristics {
            print("------------ \(characteristics.uuid)")
            if characteristics.properties.contains(.read) {
                //                    print("\(characteristics.uuid): properties contains .read")
                peripheral.readValue(for: characteristics)
            }
            
            
            if characteristics.properties.contains(.write) {
                //                              print("\(characteristics.uuid): properties contains .write")
            }
            
            if characteristics.properties.contains(.writeWithoutResponse) {
                //                              print("\(characteris//tics.uuid): properties contains .writeWithoutResponse")
            }
            
            if characteristics.properties.contains(.notify) {
                //                            print("\(characteristics.uuid): properties contains .notify")
                peripheral.setNotifyValue(true, for: characteristics)
                
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic,
                    error: Error?) {
        
        if let sensorData = characteristic.value {
            if characteristic.uuid.uuidString == CharacteristicIndoorBikeData.uuidString {
                //print(sensorData/ as! [UInt8])
                let byte = [UInt8](sensorData)
                print(byte)
                doDecodeHRMess(sensorData: sensorData)
            }
        }
    }
    
    func doDecodeHRMess(sensorData: Data) {
        
        
        //        let bytes:[UInt8] = [0x01, 0x02]
        var uint16array = [UInt16]()
        
        let uint16 = sensorData.withUnsafeBytes { $0.load(as: UInt16.self) }
        uint16array.append(uint16)
        //print("u16: \(uint16array)")
        let hrData: Result<CharacteristicIndoorBikeData, BluetoothDecodeError> = CharacteristicIndoorBikeData.decode(with: sensorData)
        
        switch hrData {
        case .success(let char):
            if let averageSpeed = averageSpeed {
                averageSpeed.text = "averageSpeed : \(averageSpeed)"
            }
            
            if let instantaneousSpeed = instantaneousSpeed {
                instantaneousSpeed.text = "instantaneousSpeed : \(String(describing: instantaneousSpeed))"
            }
            
            if let averageCadence = averageCadence {
                averageCadence.text = "averageCadence : \(String(describing: averageCadence))"
            }
            
            if let totalDistance = totalDistance {
                totalDistance.text = "totalDistance : \(String(describing: totalDistance))"
            }
            
            if let resistanceLevel = resistanceLevel {
                resistanceLevel.text = "resistanceLevel : \(String(describing: resistanceLevel))"
            }
            
            if let instantaneousPower = instantaneousPower {
                instantaneousPower.text = "instantaneousPower : \(String(describing: instantaneousPower))"
            }
            
            if let averagePower = averagePower {
                averagePower.text = "averagePower : \(String(describing: averagePower))"
            }
            
            if let energy = energy {
                energy.text = "energy : \(String(describing: energy))"
            }
            
            if let heartRate = heartRate {
                heartRate.text = "heartRate : \(String(describing: heartRate))"
            }
            
            print("========================r")
            print(char.averageSpeed ?? 0)
            print(char.instantaneousSpeed ?? 0)
            print(char.averageCadence ?? 0)
            print(char.totalDistance ?? 0)
            print(char.resistanceLevel ?? 0)
            print(char.instantaneousPower ?? 0)
            print(char.averagePower ?? 0)
            print(char.energy)
            print(char.heartRate ?? 0)
            print("=======================")
            print("")
            print("")
            print("")
            
        case .failure(let error):
            print(error)
        }
    }
}

