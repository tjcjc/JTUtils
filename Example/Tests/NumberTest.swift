//
//  NumberTest.swift
//  JTUtils_Tests
//
//  Created by JasonTai on 2019/9/3.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import JTUtils
@testable import JTUtils

class NumberTest: QuickSpec {
    override func spec() {
        describe("test number") {
            it("bytes") {
                expect(UInt64(1).bytes()) == [0, 0, 0, 0, 0, 0, 0, 1]
            }
            
            it("data") {
                expect(UInt64(1).data().jtBytes) == [0, 0, 0, 0, 0, 0, 0, 1]
            }
            
            it("bytewidth") {
                expect(UInt64.byteWidth) == 8
            }
        }
    }
}
