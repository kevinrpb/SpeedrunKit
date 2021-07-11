//
//  Link.swift
//  
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: LinkType
public enum LinkType: String {
    case this = "self"
    case baseGame = "base-game"
    case categories
    case derivedGames = "derived-games"
    case game
    case guide
    case leaderboards = "leaderboards"
    case levels
    case post
    case records
    case run
    case runs
    case series
    case splits = "splits.io"
    case variables
}
extension LinkType: Decodable {}

// MARK: Link
public struct Link {
    public let rel: LinkType? // Sometimes we don't need this and just the uri like in the user profile where links are parameters and not in the 'links' array
    public let uri: String

    public var url: URL? { URL(string: uri) }
}

extension Link: Decodable {}
