//
//  Number+Extension.swift
//  JTUtils
//
//  Created by JasonTai on 2019/7/12.
//

import Foundation

extension FixedWidthInteger {
    func data(isBigEndian: Bool = false) -> Data {
        var unsafe = isBigEndian ? self.bigEndian : self.littleEndian
        return Data(buffer: UnsafeBufferPointer(start: &unsafe, count: 1))
    }

    func bytes(isBigEndian: Bool = false) -> [UInt8] {
        return self.data(isBigEndian: isBigEndian).bytes
    }
}
