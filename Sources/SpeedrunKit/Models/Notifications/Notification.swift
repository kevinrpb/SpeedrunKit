//
//  Notification.swift
//  
//
//  Created by Kevin Romero Peces-Barba on 11/7/21.
//

import Foundation

// MARK: NotificationStatus
public enum NotificationStatus: String {
    case read
    case unread
}

extension NotificationStatus: Decodable {}

// MARK: Notification
public struct Notification {
    public let id: String
    public let created: Date
    public let status: NotificationStatus
    public let text: String
    public let item: Link
    public let links: [Link]
}

extension Notification: Decodable {}
