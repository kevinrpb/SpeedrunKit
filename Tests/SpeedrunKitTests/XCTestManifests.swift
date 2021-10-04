import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SpeedrunKitTests.allTests),
        testCase(SpeedrunKitTests_iOS15.allTests),
    ]
}
#endif
