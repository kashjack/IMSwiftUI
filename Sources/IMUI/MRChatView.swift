//
//  ChatView.swift
//  IMDemo
//
//  Created by DK on 2023/12/7.
//

import SwiftUI

// 聊天服务
public class ChatService: ObservableObject {
    @Published var messages: [MRMessage] = [] // 消息列表
    
    func sendMessage(_ chatMessage: MRMessage) {
        messages.append(chatMessage)
        // 此处可以添加网络请求逻辑，将消息发送到服务器
    }
}

public struct MRChatView: View {
    // 假设当前用户的昵称是 "Me"
    let currentUser = "Me"
    @State private var messageText: String = ""
    @ObservedObject var chatService = ChatService()
    
    public init() {}
    
    public var body: some View {
        VStack {
            ScrollViewReader { scrollViewProxy in
                ScrollView {
                    LazyVStack {
                        ForEach(chatService.messages) { message in
                            MessageView(message: message)
                        }
                    }
                }
//                .onChange(of: chatService.messages, initial: true) { oldCount, newCount in
//                    if let lastMessage = chatService.messages.last {
//                        scrollViewProxy.scrollTo(lastMessage.id, anchor: .bottom)
//                    }
//                }
            }
            
            HStack {
                TextField("Enter message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button("Send") {
                    let newMessage = MRMessage(time: "", sender: currentUser, content: messageText, isFromCurrentUser: (Int.random(in: 0...1) != 0))
                    chatService.sendMessage(newMessage)
                    messageText = ""
                }
                .disabled(messageText.isEmpty)
            }
            .padding()
        }
        .navigationTitle("Chat")
    }
}

#Preview {
    MRChatView()
}
