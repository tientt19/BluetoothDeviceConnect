//
//  BioLightData.swift
//  BluetoothDeviceConnect
//
//  Created by Valerian on 28/03/2022.
//

import Foundation

struct BiolightData {
    var header: UInt8
    var length: Int
    var dataBlock: DataBlock?
    var checkSum: UInt8

    init?(data: [UInt8]) {
        var `data` = data
        guard data.count >= 3 else {
            return nil
        }
        let header = data.removeFirst()
        let checkSum = data.removeLast()
        // check checkSum
        guard data.checkSum(to: data.count - 1) == checkSum else {
            return nil
        }
        let length = Int(data.removeFirst())
        let dataBlock = data
        self = BiolightData(header: header, length: length, dataBlock: dataBlock, checkSum: checkSum)
    }

    init(header: UInt8, dataBlock: [UInt8]) {
        self.header = header
        self.length = dataBlock.count + 1
        self.dataBlock = DataBlock(data: dataBlock)
        var array: [UInt8] = [UInt8(length)]
        array.append(contentsOf: dataBlock)
        let checkSum = array.checkSum(to: length - 1)
        self.checkSum = checkSum
    }

    init(header: UInt8, dataBlock: DataBlock) {
        self.header = header
        self.length = dataBlock.getBytes().count + 1
        self.dataBlock = dataBlock
        var array: [UInt8] = [UInt8(length)]
        array.append(contentsOf: dataBlock.getBytes())
        let checkSum = array.checkSum(to: length - 1)
        self.checkSum = checkSum
    }

    init(header: UInt8, length: Int, dataBlock: [UInt8], checkSum: UInt8) {
        self.header = header
        self.length = length
        self.dataBlock = DataBlock(data: dataBlock)
        self.checkSum = checkSum
    }

    func getBytes() -> [UInt8] {
        var bytes: [UInt8] = [header]
        bytes.append(UInt8(length))
        bytes.append(contentsOf: dataBlock?.getBytes() ?? [])
        bytes.append(checkSum)
        return bytes
    }
}
// MARK: - BioLightData - DataBlock
extension BiolightData {
    struct DataBlock {
        var id: UInt8
        var dataSegment: [UInt8]

        init(id: UInt8, dataSegment: [UInt8]) {
            self.id = id
            self.dataSegment = dataSegment
        }

        init?(data: [UInt8]) {
            var `data` = data
            guard !data.isEmpty else {
                return nil
            }
            self.id = data.removeFirst()
            self.dataSegment = data
        }

        func getBytes() -> [UInt8] {
            var bytes = [id]
            bytes.append(contentsOf: dataSegment)
            return bytes
        }
    }
}

