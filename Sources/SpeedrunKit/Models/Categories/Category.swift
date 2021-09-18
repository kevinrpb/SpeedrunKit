//
//  Category.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: CategoryType
public enum CategoryType: String {
    case perGame = "per-game"
    case perLevel = "per-level"
}

extension CategoryType: Decodable {}

// MARK: Category
public struct Category {
    public let id: String
    public let name: String
    public let weblink: String
    public let type: CategoryType
    public let rules: String
//    public let players // TODO: 
    public let miscellaneous: Bool
    public let links: [Link]
}

extension Category: Decodable {}
