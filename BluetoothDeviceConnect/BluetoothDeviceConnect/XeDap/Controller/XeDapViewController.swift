//
//  XeDap.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 24/03/2022.
//

import UIKit
import CoreBluetooth

class XeDapViewController: UIViewController {
    
    var presenter : XeDapPresenterProtocols?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    func onHeartRateReceived(_ heartRate: Int) {
        
    }
}

extension XeDapViewController : XeDapViewProtocols {
    func presentDataToView(_ data: CharacteristicIndoorBikeData) {
        if let averageSpeedData = data.averageSpeed?.speed.value {
            averageSpeed.text = "averageSpeed : \(averageSpeedData)"
        }
        
        if let instantaneousSpeedData = data.instantaneousSpeed?.speed.value {
            instantaneousSpeed.text = "instantaneousSpeed : \(String(describing: instantaneousSpeedData))"
        }
        
        if let averageCadenceData =  data.averageCadence?.value {
            averageCadence.text = "averageCadence : \(String(describing: averageCadenceData))"
        }
        
        if let totalDistanceData =  data.totalDistance?.value {
            totalDistance.text = "totalDistance : \(String(describing: totalDistanceData))"
        }
        
        if let resistanceLevelData =  data.resistanceLevel {
            resistanceLevel.text = "resistanceLevel : \(String(describing: resistanceLevelData))"
        }
        
        if let instantaneousPowerData =  data.instantaneousPower?.power {
            instantaneousPower.text = "instantaneousPower : \(String(describing: instantaneousPowerData))"
        }
        
        if let averagePowerData =  data.averagePower?.power {
            averagePower.text = "averagePower : \(String(describing: averagePowerData))"
        }
        
        energy.text = "energy : \(String(describing: data.energy.total))"
        
        if let heartRateData =  data.heartRate?.value {
            heartRate.text = "heartRate : \(String(describing: heartRateData))"
        }
    }
}
