//
//  Endpoint.swift
//  
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation


// MARK: - Endpoints
public enum Endpoint {
    // MARK: Categories
    case getCategory(categoryID: String)
    case getCategoryRecords(categoryID: String)
    case getCategoryVariables(categoryID: String)

    // MARK: Games
    case getAllGames
    case getGame(gameID: String)
    case getGameCategories(gameID: String)
    case getGameLevels(gameID: String)
    case getGameVariables(gameID: String)
    case getGameDerivedGames(gameID: String)
    case getGameRecords(gameID: String)

    // MARK: Guests
    case getGuest(guestName: String)

    // MARK: Leaderboards
    case getLeaderboardForGameAndCategory(gameID: String, categoryID: String)
    case getLeaderboardForGameLevelAndCategory(gameID: String, levelID: String, categoryID: String)

    // MARK: Levels
    case getLevel(levelID: String)
    case getLevelCategories(levelID: String)
    case getLevelVariables(levelID: String)
    case getLevelRecords(levelID: String)

    // MARK: Notifications
    case getAllNotifications

    // MARK: Platforms
    case getAllPlatforms
    case getPlatform(platformID: String)

    // MARK: Profile
    case getProfile

    // MARK: Regions
    case getRegions
    case getRegion(regionID: String)

    // MARK: Runs
    case getAllRuns
    case getRun(runID: String)
    case postRuns
    case putRunStatus(runID: String)
    case putRunPlayers(runID: String)
    case deleteRun(runID: String)

    // MARK: Series
    case getAllSeries
    case getSeries(seriesID: String)
    case getSeriesGames(seriesID: String)

    // MARK: Users
    case getAllUsers
    case getUser(userID: String)
    case getUserPersonalBests(userID: String)

    // MARK: Variables
    case getVariable(variableID: String)
}


// MARK: - URL
extension Endpoint {
    static let baseURL          = URL(string: "https://www.speedrun.com/api/v1/")!

    static let categoriesURL    = baseURL.appendingPathComponent("categories")
    static let gamesURL         = baseURL.appendingPathComponent("games")
    static let guestsURL        = baseURL.appendingPathComponent("guests")
    static let leaderboardsURL  = baseURL.appendingPathComponent("leaderboards")
    static let levelsURL        = baseURL.appendingPathComponent("levels")
    static let notificationsURL = baseURL.appendingPathComponent("notifications")
    static let platformsURL     = baseURL.appendingPathComponent("platforms")
    static let profileURL       = baseURL.appendingPathComponent("profile")
    static let regionsURL       = baseURL.appendingPathComponent("regions")
    static let runsURL          = baseURL.appendingPathComponent("runs")
    static let seriesURL        = baseURL.appendingPathComponent("series")
    static let usersURL         = baseURL.appendingPathComponent("users")
    static let variablesURL     = baseURL.appendingPathComponent("variables")

    public var url: URL {
        switch self {
        // MARK: Categories
        case .getCategory(let categoryID):
            return Self.categoriesURL
                .appendingPathComponent(categoryID)
        case .getCategoryRecords(let categoryID):
            return Self.categoriesURL
                .appendingPathComponent(categoryID)
                .appendingPathComponent("records")
        case .getCategoryVariables(let categoryID):
            return Self.categoriesURL
                .appendingPathComponent(categoryID)
                .appendingPathComponent("variables")

        // MARK: Games
        case .getAllGames:
            return Self.gamesURL
        case .getGame(let gameID):
            return Self.gamesURL
                .appendingPathComponent(gameID)
        case .getGameCategories(let gameID):
            return Self.gamesURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("categories")
        case .getGameLevels(let gameID):
            return Self.gamesURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("levels")
        case .getGameVariables(let gameID):
            return Self.gamesURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("variables")
        case .getGameDerivedGames(let gameID):
            return Self.gamesURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("derived-games")
        case .getGameRecords(let gameID):
            return Self.gamesURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("records")

        // MARK: Guests
        case .getGuest(let guestName):
            return Self.guestsURL
                .appendingPathComponent(guestName)

        // MARK: Leaderboards
        case .getLeaderboardForGameAndCategory(let gameID, let categoryID):
            return Self.leaderboardsURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("category")
                .appendingPathComponent(categoryID)
        case .getLeaderboardForGameLevelAndCategory(let gameID, let levelID, let categoryID):
            return Self.leaderboardsURL
                .appendingPathComponent(gameID)
                .appendingPathComponent("level")
                .appendingPathComponent(levelID)
                .appendingPathComponent(categoryID)

        // MARK: Levels
        case .getLevel(let levelID):
            return Self.levelsURL
                .appendingPathComponent(levelID)
        case .getLevelCategories(let levelID):
            return Self.levelsURL
                .appendingPathComponent(levelID)
                .appendingPathComponent("categories")
        case .getLevelVariables(let levelID):
            return Self.levelsURL
                .appendingPathComponent(levelID)
                .appendingPathComponent("variables")
        case .getLevelRecords(let levelID):
            return Self.levelsURL
                .appendingPathComponent(levelID)
                .appendingPathComponent("records")

        // MARK: Notifications
        case .getAllNotifications:
            return Self.notificationsURL

        // MARK: Platforms
        case .getAllPlatforms:
            return Self.platformsURL
        case .getPlatform(let platformID):
            return Self.platformsURL
                .appendingPathComponent(platformID)

        // MARK: Profile
        case .getProfile:
            return Self.profileURL

        // MARK: Regions
        case .getRegions:
            return Self.regionsURL
        case .getRegion(let regionID):
            return Self.regionsURL
                .appendingPathComponent(regionID)

        // MARK: Runs
        case .getAllRuns:
            return Self.runsURL
        case .getRun(let runID):
            return Self.runsURL
                .appendingPathComponent(runID)
        case .postRuns:
            return Self.runsURL
        case .putRunStatus(let runID):
            return Self.runsURL
                .appendingPathComponent(runID)
                .appendingPathComponent("status")
        case .putRunPlayers(let runID):
            return Self.runsURL
                .appendingPathComponent(runID)
                .appendingPathComponent("players")
        case .deleteRun(let runID):
            return Self.runsURL
                .appendingPathComponent(runID)

        // MARK: Series
        case .getAllSeries:
            return Self.seriesURL
        case .getSeries(let seriesID):
            return Self.seriesURL
                .appendingPathComponent(seriesID)
        case .getSeriesGames(let seriesID):
            return Self.seriesURL
                .appendingPathComponent(seriesID)
                .appendingPathComponent("games")

        // MARK: Users
        case .getAllUsers:
            return Self.usersURL
        case .getUser(let userID):
            return Self.usersURL
                .appendingPathComponent(userID)
        case .getUserPersonalBests(let userID):
            return Self.usersURL
                .appendingPathComponent(userID)
                .appendingPathComponent("personal-bests")

        // MARK: Variables
        case .getVariable(let variableID):
            return Self.variablesURL
                .appendingPathComponent(variableID)
        }
    }
}

// MARK: - Method
public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case UPDATE
}

extension Endpoint {
    public var method: HTTPMethod {
        switch self {
        // MARK: POST
        case .postRuns:
            return .POST

        // MARK: PUT
        case .putRunStatus,
             .putRunPlayers:
            return .PUT

        // MARK: DELETE
        case .deleteRun:
            return .DELETE

        // MARK: GET (default)
        default:
            return .GET
        }
    }
}
