//
//  XeDap.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 24/03/2022.
//

import UIKit

class XeDapViewController: UIViewController {
    
    var presenter : XeDapPresenterProtocols?
    
    @IBOutlet weak var averageSpeed : UILabel!
    @IBOutlet weak var instantaneousSpeed : UILabel!
    @IBOutlet weak var averageCadence : UILabel!
    @IBOutlet weak var totalDistance : UILabel!
    @IBOutlet weak var resistanceLevel : UILabel!
    @IBOutlet weak var instantaneousPower : UILabel!
    @IBOutlet weak var averagePower : UILabel!
    @IBOutlet weak var energy : UILabel!
    @IBOutlet weak var heartRate : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
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
