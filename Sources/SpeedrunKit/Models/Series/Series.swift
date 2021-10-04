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
    public let names: [String : String?]
    public let abbreviation: String
    public let weblink: String
    public let moderators: [String : String]
    public let created: Date?
    private let _assets: [String : Asset?]? // HACK: Dictionaries can only be decoded with String or Int is the key: https://bugs.swift.org/browse/SR-7788
    public var assets: [AssetType : Asset?]? {
        guard let _assets = _assets else { return [:] }

        return Asset.getDict(from: _assets)
    }
    public let links: [Link]
}

extension Series: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case names
        case abbreviation
        case weblink
        case moderators
        case created
        case _assets = "assets"
        case links
    }
}
