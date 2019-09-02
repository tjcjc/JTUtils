// https://github.com/Quick/Quick

import Quick
import Nimble
import JTUtils
@testable import JTUtils

class DataTest: QuickSpec {
    override func spec() {
        describe("test data") {
            it("jtbytes") {
                let data = Data(bytes: [1,2,3])
                expect(data.jtBytes) == [1,2,3]
            }

            it("sub data") {
                let data = Data(bytes: [1,2,3])
                expect(data.subData(0, length: 1).jtBytes) == [1]
            }
            
            it("read number") {
                var data = UInt32(2).data()
                let i64data = UInt64(5).data()
                data.append(i64data)
                let num_1: UInt32 = data.readNum()
                expect(num_1) == UInt32(2)
                print(MemoryLayout.size(ofValue: num_1))
                let num_2: UInt64 = data.readNum(index: 4)
                expect(num_2) == UInt64(5)
            }
        }
    }
}
