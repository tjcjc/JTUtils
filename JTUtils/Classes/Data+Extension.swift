//
//  Data+Extension.swift
//  JTUtils
//
//  Created by JasonTai on 2019/7/12.
//

import Foundation
public extension Data {
    func subData(_ start: Int = 0, length: Int) -> Data {
        return self[self.index(self.startIndex, offsetBy: start) ..< self.index(self.startIndex, offsetBy: start + length)]
    }

    /// read a Number from Data
    ///
    /// - Parameters:
    ///   - index: read index offset the start index
    ///   - isLittleEndian: Mac use big Endian default
    /// - Returns: FixedWidthInteger
    func readNum<T: FixedWidthInteger>(index: Int = 0, isLittleEndian: Bool = false) -> T {
        let len = T.byteWidth
        let data = self.subData(index, length: len)
        let tmpVal: T = data.withUnsafeBytes {
            if let address = $0.baseAddress {
                return address.bindMemory(to: T.self, capacity: 1).pointee
            } else {
                fatalError("read error from data")
            }
        }
        if len > 1 {
            return isLittleEndian ? T(littleEndian: tmpVal) : T(bigEndian: tmpVal)
        } else {
            return tmpVal
        }
    }

    var jtBytes: [UInt8] {
        return self.map { UInt8($0) }
    }
}
