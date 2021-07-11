//
//  Run.swift
//  
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: RunVideos
public struct RunVideos {
    public let text: String
    public let links: [Link]
}

extension RunVideos: Decodable {}

// MARK: RunStatus
public struct RunStatus {
    public enum Status: String {
        case new
        case rejected
        case verified
    }

    public let status: Status
    public let examiner: String?
    public let verifyDate: Date?
    public let reason: String?
}

extension RunStatus.Status: Decodable {}
extension RunStatus: Decodable {
    enum CodingKeys: String, CodingKey {
        case status
        case examiner
        case verifyDate = "verify-date"
        case reason
    }
}

// MARK: RunPlayer
public struct RunPlayer {
    public enum Kind: String {
        case user
        case guest
    }

    public let rel: Kind
    public let id: String?
    public let name: String?
    public let uri: String

    public var url: URL? { URL(string: uri) }
}

extension RunPlayer.Kind: Decodable {}
extension RunPlayer: Decodable {}

// MARK: RunSystem
public struct RunSystem {
    public let platform: String
    public let emulated: Bool
    public let region: String?
}

extension RunSystem: Decodable {}

// MARK: Run
public struct Run {
    public let id: String
    public let weblink: String
    public let game: String
    public let level: String?
    public let category: String
    public let videos: RunVideos
    public let comment: String
    public let status: RunStatus
    public let players: [RunPlayer]
    public let date: Date?
    public let submitted: Date?
    public let times: [String: String]
    public let system: RunSystem
    public let splits: Link
    public let values: [String: String]
    public let links: [Link]
}

extension Run: Decodable {}
