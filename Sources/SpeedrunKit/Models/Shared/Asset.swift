//
//  Assets.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: AssetType
public enum AssetType: String {
    case background
    case coverTiny = "cover-tiny"
    case coverSmall = "cover-small"
    case coverMedium = "cover-medium"
    case coverLarge = "cover-large"
    case foreground
    case icon
    case logo
    case trophyFirst = "trophy-1st"
    case trophySecond = "trophy-2nd"
    case trophyThird = "trophy-3rd"
    case trophyFourth = "trophy-4th"
}

extension AssetType: Decodable {}
extension AssetType: Hashable {}

// MARK: Asset
public struct Asset {
    public let uri: String
    public let width: Int
    public let height: Int

    public var url: URL? { URL(string: uri) }
}

extension Asset: Decodable {}
