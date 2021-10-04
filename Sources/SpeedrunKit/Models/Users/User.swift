//
//  User.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK TODO: UsernameStyle
//public struct UsernameStyle {
//    public enum Style: String {
//        case solid
//        case gradient
//    }
//
//    public struct Color {
//        public let light: String
//        public let dark: String
//    }
//
//    public let style: Style
//    public let color: Color?
//}
//
//extension UsernameStyle.Style: Decodable {}
//extension UsernameStyle.Color: Decodable {}
//extension UsernameStyle: Decodable {}

// MARK: UserRole
public enum UserRole: String {
    case user
    case moderator
    case admin
    case programmer
    case trusted
    case banned
}

extension UserRole: Decodable {}

// MARK: User
public struct User {
    public let id: String
    public let names: [String : String?]
    public let weblink: String
//    public let nameStyle: UsernameStyle // TODO:
    public let role: UserRole
    public let signup: Date?
//    public let location // TODO:
    public let twitch: Link?
    public let hitbox: Link?
    public let youtube: Link?
    public let twitter: Link?
    public let speedrunslive: Link?
    public let links: [Link]
}

extension User: Decodable {}
