//
//  MessageManagerImpl.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/15.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

class MessageManagerImpl: MessageManager {
    private let disposeBag = DisposeBag()
    
    // MARK: - Properties
    
    private let sender: MessageSender
    
    private let receiver: MessageReceiver
    
    // MARK: - MessageManager protocol
    
    func send(_ message: Message) -> Observable<String> {
        return sender.send(message)
    }
    
    func connect(options: [SAVDataEventType]?) -> Observable<SAVDataEvent<Message>> {
        return receiver.connect(options: options)
    }
    
    // MARK: - Initialization
    
    required init(sender: MessageSender, receiver: MessageReceiver) {
        self.sender = sender
        self.receiver = receiver
    }
}
