//
//  Variable.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: VariableScope
public struct VariableScope {
    public enum Kind {
        case global
        case fullGame
        case allLevels
        case singleLevel
    }

    public let type: Kind
}

extension VariableScope.Kind: Decodable {
    enum CodingKeys: String, CodingKey {
        case global
        case fullGame = "full-game"
        case allLevels = "all-levels"
        case singleLevel = "single-level"
    }
}
extension VariableScope: Decodable {}

// MARK: Variable
public struct Variable {
    public let id: String
    public let name: String
    public let category: String?
    public let scope: VariableScope
    public let mandatory: Bool
    public let userDefined: Bool
    public let obsoletes: Bool
//    public let values: // TODO:
    public let isSubcategory: Bool
    public let links: [Link]
}

extension Variable: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case category
        case scope
        case mandatory
        case userDefined = "user-defined"
        case obsoletes
    //    case values
        case isSubcategory = "is-subcategory"
        case links
    }
}
