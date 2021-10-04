import XCTest
@testable import SpeedrunKit

@available(iOS 15.0, *)
final class SpeedrunKitTests_iOS15: XCTestCase {
    func testGetAllGames() async throws {
        let response: Response<[Game]> = try await SpeedrunAPI.shared.call(.getAllGames)
        let games = response.data

        XCTAssertGreaterThan(games.count, 0)
    }

    static var allTests = [
        ("getAllGames", testGetAllGames),
    ]
}
