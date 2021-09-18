//
//  Region.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: Region
public struct Region {
    public let id: String
    public let name: String
    public let links: [Link]
}

extension Region: Decodable {}
