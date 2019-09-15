import XCTest
@testable import Logboard

final class LogboardTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Logboard().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample)
    ]
}
