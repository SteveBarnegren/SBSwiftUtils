import XCTest

class CollectionEachWithIsLastTests: XCTestCase {

    func test_MultipleItems() {

        let array = ["a", "b", "c"]

        var items = [String]()
        var flags = [Bool]()

        for (item, flag) in array.eachWithIsLast() {
            items.append(item)
            flags.append(flag)
        }

        XCTAssertEqual(items, ["a", "b", "c"])
        XCTAssertEqual(flags, [false, false, true])
    }

    func test_SingleItem() {

        let array = ["a"]

        var items = [String]()
        var flags = [Bool]()

        for (item, flag) in array.eachWithIsLast() {
            items.append(item)
            flags.append(flag)
        }

        XCTAssertEqual(items, ["a"])
        XCTAssertEqual(flags, [true])
    }

    func test_NoItems() {

        let array = [Any]()

        var loopRan = false
        for (_, _) in array.eachWithIsLast() {
            loopRan = true
        }

        XCTAssertFalse(loopRan)
    }
}
