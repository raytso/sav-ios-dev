//
//  MessageSenderImpl.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/14.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

class MessageSenderImpl: MessageSender {
    private let disposeBag = DisposeBag()
    
    // MARK: - Properties
    
    private let ref: SAVReference
    
    // MARK: - Initialization
    
    required init(targetRef: SAVReference) {
        self.ref = targetRef
    }
    
    // MARK: - MessageSender protocol
    
    func send(_ message: Message) -> Observable<String> {
        return self.set(message)
    }   
}

extension MessageSenderImpl: SAVReferenceSettable {
    typealias SetItemType = Message
    
    func set(_ payload: Message) -> Observable<String> {
        return ref.push(payload)
    }
}
