//
//  RuleSet.swift
//  SpeedrunKit
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: RunTimeType
public enum RunTimeType: String {
    case realTime = "realtime"
    case realTimeNoLoads = "realtime_noloads"
    case ingameTime = "ingame"
}

extension RunTimeType: Decodable {}

// MARK: RuleSet
public struct RuleSet {
    let showMilliseconds: Bool
    let requireVerification: Bool
    let requireVideo: Bool
    let runTimes: [RunTimeType]
    let defaultTime: RunTimeType
    let emulatorsAllowed: Bool
}

extension RuleSet: Decodable {
    enum CodingKeys: String, CodingKey {
        case showMilliseconds = "show-milliseconds"
        case requireVerification = "require-verification"
        case requireVideo = "require-video"
        case runTimes = "run-times"
        case defaultTime = "default-time"
        case emulatorsAllowed = "emulators-allowed"
    }
}
