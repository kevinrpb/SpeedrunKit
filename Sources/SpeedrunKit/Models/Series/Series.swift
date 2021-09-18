//
//  Series.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: Series
public struct Series {
    public let id: String
    public let names: [String: String]
    public let abbreviation: String
    public let weblink: String
    public let moderators: [String: String]
    public let created: Date?
    public let assets: [AssetType: Asset?]
    public let links: [Link]
}

extension Series: Decodable {}
