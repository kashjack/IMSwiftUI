//
//  MRReceiveService.swift
//  IMDemo
//
//  Created by DK on 2023/12/8.
//

import Foundation


class MRReceiveService: ObservableObject {
    @Published var messages: [MRMessage] = [] // 消息列表
    
    func sendMessage(_ chatMessage: MRMessage) {
        messages.append(chatMessage)
        // 此处可以添加网络请求逻辑，将消息发送到服务器
    }
}
