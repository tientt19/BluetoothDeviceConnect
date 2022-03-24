//
//  SleepSampleData.swift
//  1SK Test Chart
//
//  Created by admin on 09/12/2021.
//

import Foundation

enum SleepType {
    case asleep
    case light
    case deep
    case rem
}

struct SleepData {
    var type : SleepType
    var duration : Int
    
    init(type : SleepType, duration: Int) {
        self.type = type
        self.duration = duration
    }
}

class SleepSampleData {
    var typeArray : [SleepType] = [.asleep, .light, .deep, .rem]
    
    var data : [SleepData] {
        var array = [SleepData]()
        for _ in 0...37 {
            if let random = typeArray.randomElement() {
                let ele = SleepData(type: random, duration: 10)
                array.append(ele)
            }
        }
        return array
    }
}

class StepSampleData {
    var data : [Int] {
        var value = [Int]()
        for _ in 0...144 {
            let random = Int.random(in: 0..<1000)
                value.append(random)
        }
        return value
    }
}
