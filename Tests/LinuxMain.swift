import XCTest

import SpeedrunKitTests

var tests = [XCTestCaseEntry]()
tests += SpeedrunKitTests.allTests()
if #available(iOS 15.0, *) {
    tests += SpeedrunKitTests_iOS15.allTests()
}
XCTMain(tests)
