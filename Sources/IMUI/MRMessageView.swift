//
//  MessageView.swift
//  IMDemo
//
//  Created by DK on 2023/12/7.
//

import SwiftUI

struct MessageView: View {
    
    let message: MRMessage
    
    var isMe: Bool {
        return message.isFromCurrentUser
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
    
            // 用户头像
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            // 消息气泡
            Text(message.content)
                .padding(10)
                .background(isMe ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            Spacer()
        }
        .environment(\.layoutDirection, isMe ? .rightToLeft : .leftToRight)
//        .padding(!isCurrentUser ? .leading : .trailing, 0)  //根据是不是当前用户来调整内间距
        .padding(.horizontal, 10)
//        .padding(.vertical, 5)
//        .transition(.slide) // 使用滑动动画
//        .animation(.default, value: 0)
    }
}

#Preview {
    MessageView(message: MRMessage(time: "", sender: "me",  content: "maessa积分卡世ext", isFromCurrentUser: true))
}
