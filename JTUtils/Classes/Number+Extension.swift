//
//  Number+Extension.swift
//  JTUtils
//
//  Created by JasonTai on 2019/7/12.
//

import Foundation

public extension FixedWidthInteger {
    func data(isLittleEndian: Bool = false) -> Data {
        var unsafe = isLittleEndian ? self.littleEndian : self.bigEndian
        return Data(buffer: UnsafeBufferPointer(start: &unsafe, count: 1))
    }

    func bytes(isLittleEndian: Bool = false) -> [UInt8] {
        return self.data(isLittleEndian: isLittleEndian).jtBytes
    }

    static var byteWidth: Int {
        return self.bitWidth / 8
    }
}
