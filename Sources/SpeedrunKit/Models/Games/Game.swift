//
//  Game.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: Game
public struct Game {
    public let id: String
    public let names: [String : String?] // NOTE: Might be better to make names a map from enum (type of name) to the name
    public let abbreviation: String
    public let weblink: String
    public let released: Int
    public let release_date: String?
    public let ruleset: RuleSet?
    public let romhack: Bool
    public let gametypes: [String]?
    public let platforms: [String]?
    public let regions: [String]?
    public let genres: [String]?
    public let engines: [String]?
    public let developers: [String]?
    public let publishers: [String]?
    public let moderators: [String : String]? // NOTE: Might be better to make names a map from id to enum of permission (moderator, super, etc)
    public let created: Date?
    private let _assets: [String : Asset?]? // HACK: Dictionaries can only be decoded with String or Int is the key: https://bugs.swift.org/browse/SR-7788
    public var assets: [AssetType : Asset?]? {
        guard let _assets = _assets else { return [:] }

        var typedAssets: [AssetType : Asset?] = [:]

        for key in _assets.keys {
            if let type = AssetType(rawValue: key) {
                typedAssets[type] = _assets[key]
            }
        }

        return typedAssets
    }
    public let links: [Link]?
}

extension Game: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case names
        case abbreviation
        case weblink
        case released
        case release_date = "release-date"
        case ruleset
        case romhack
        case gametypes
        case platforms
        case regions
        case genres
        case engines
        case developers
        case publishers
        case moderators
        case created
        case _assets = "assets"
        case links
    }
}
