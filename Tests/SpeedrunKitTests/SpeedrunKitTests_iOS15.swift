import XCTest
@testable import SpeedrunKit

@available(iOS 15.0, *)
final class SpeedrunKitTests_iOS15: XCTestCase {
    func testGetAllGames() async throws {
        let response: Response<[Game]> = try await SpeedrunAPI.shared.call(.getAllGames)
        let games = response.data

        XCTAssertGreaterThan(games.count, 0)
    }

    func testGetAllPlatforms() async throws {
        let response: Response<[Platform]> = try await SpeedrunAPI.shared.call(.getAllPlatforms)
        let platforms = response.data

        XCTAssertGreaterThan(platforms.count, 0)
    }

    func testGetAllRegions() async throws {
        let response: Response<[Region]> = try await SpeedrunAPI.shared.call(.getAllRegions)
        let regions = response.data

        XCTAssertGreaterThan(regions.count, 0)
    }

    func testGetAllSeries() async throws {
        let response: Response<[Series]> = try await SpeedrunAPI.shared.call(.getAllSeries)
        let series = response.data

        XCTAssertGreaterThan(series.count, 0)
    }

    static var allTests = [
        ("Get All Games", testGetAllGames),
        ("Get All Platforms", testGetAllPlatforms),
        ("Get All Regions", testGetAllRegions),
        ("Get All Series", testGetAllSeries),
    ]
}
