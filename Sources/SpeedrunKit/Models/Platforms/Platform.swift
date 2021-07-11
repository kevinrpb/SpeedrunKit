//
//  Platform.swift
//  
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: Platform
public struct Platform {
    public let id: String
    public let name: String
    public let released: Int
    public let links: [Link]
}

extension Platform: Decodable {}
