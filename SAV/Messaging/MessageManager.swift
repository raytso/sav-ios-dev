//
//  MessageManager.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/15.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation

protocol MessageManager: MessageSender, MessageReceiver {
    init(sender: MessageSender, receiver: MessageReceiver)
}
