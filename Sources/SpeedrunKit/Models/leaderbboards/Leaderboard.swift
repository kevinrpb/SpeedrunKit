//
//  Leaderboard.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: LeaderboardRun
public struct LeaderboardRun {
    public let place: Int
//    public let run: Run
}

extension LeaderboardRun: Decodable {}

// MARK: Leaderboard
public struct Leaderboard {
    public let weblink: String
    public let game: String
    public let category: String
    public let level: String?
    public let platform: String?
    public let region: String?
    public let emulators: Bool?
    public let videoOnly: Bool
    public let timing: RunTimeType
    public let values: [String: String]
    public let runs: [LeaderboardRun]
    public let links: [Link]
}

extension Leaderboard: Decodable {}
