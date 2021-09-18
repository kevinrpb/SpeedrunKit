//
//  Level.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: Level
public struct Level {
    public let id: String
    public let name: String
    public let weblink: String
    public let rules: String
    public let links: [Link]
}

extension Level: Decodable {}
