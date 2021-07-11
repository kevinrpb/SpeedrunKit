//
//  Game.swift
//  
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: Game
public struct Game {
    public let id: String
    public let names: [String: String?] // NOTE: Might be better to make names a map from enum (type of name) to the name
    public let abbreviation: String
    public let weblink: String
    public let release_date: String?
    public let ruleset: RuleSet?
    public let gametypes: [String]?
    public let platforms: [String]?
    public let regions: [String]?
    public let genres: [String]?
    public let engines: [String]?
    public let developers: [String]?
    public let publishers: [String]?
    public let moderators: [String: String]? // NOTE: Might be better to make names a map from id to enum of permission (moderator, super, etc)
    public let created: Date?
    public let assets: [AssetType: Asset?]?
    public let links: [Link]?
}

extension Game: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case names
        case abbreviation
        case weblink
        case release_date = "release-date"
        case ruleset
        case gametypes
        case platforms
        case regions
        case genres
        case engines
        case developers
        case publishers
        case moderators
        case created
        case assets
        case links
    }
}
