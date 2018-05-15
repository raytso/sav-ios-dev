//
//  MessageSender.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/13.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

protocol MessageSender {
    
    /**
     Use this function to send a `Message`.
     
     - parameter message: the `Message` to send.
     
     - Returns: the reference key `String` to said message.
     */
    func send(_ message: Message) -> Observable<String>
}
