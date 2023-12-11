//
//  MRMessage.swift
//  IMDemo
//
//  Created by DK on 2023/12/8.
//

import Foundation

enum MRMessageType {
    case text
    case voice
    case image
}

// 消息模型
struct MRMessage: Identifiable, Equatable {
    let id = UUID()
    let time: String
    let sender: String  // 发送者昵称
    let senderId: String = ""
    let messageType: MRMessageType = .text
    let content: String
    let isFromCurrentUser: Bool
}
