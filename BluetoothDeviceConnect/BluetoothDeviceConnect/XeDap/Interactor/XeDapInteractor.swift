//
//  XeDapInteractor.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation
import CoreBluetooth
import FitnessUnits

class XeDapInteractor : NSObject, XeDapInteractorInputProtocols {
    
    weak var presenter: XeDapInteractorOutputProtocols?
    var centralManager: CBCentralManager!
    var weightPeripheral: CBPeripheral!
    
    func setUpCentralManager() {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    func handleDecodeHRMess(sensorData: Data) {
        //        let bytes:[UInt8] = [0x01, 0x02]
        var uint16array = [UInt16]()
        
        let uint16 = sensorData.withUnsafeBytes { $0.load(as: UInt16.self) }
        uint16array.append(uint16)
        //print("u16: \(uint16array)")
        let hrData: Result<CharacteristicIndoorBikeData, BluetoothDecodeError> = CharacteristicIndoorBikeData.decode(with: sensorData)
        
        switch hrData {
        case .success(let char):
            // send didHandle data
            presenter?.didReceiveData(char)
        case .failure(let error):
            print(error)
        }
    }
}

//MARK: -CBCentralManagerDelegate
extension XeDapInteractor : CBCentralManagerDelegate {
    
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
        
        func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            
            if peripheral.name == "YESOUL2803083" {
                weightPeripheral = peripheral
                self.centralManager.stopScan()
                self.centralManager.connect(weightPeripheral)
                weightPeripheral.delegate = self
            }
        }
        
        
        func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
            print("Connected!")
            weightPeripheral.discoverServices(nil)
        }
    }
}

//MARK: -CBPeripheralDelegate
extension XeDapInteractor: CBPeripheralDelegate {
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
                // pass data to interactor handle
                handleDecodeHRMess(sensorData: sensorData)
            }
        }
    }
}


