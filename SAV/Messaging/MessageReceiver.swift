//
//  MessageReceiver.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/14.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

protocol MessageReceiver {
    
    /**
     Use this function to receive incoming `Message`s.
     
     - parameter options: Specify which types of `SAVDataEventType` to receive. Passing in `nil` will be defaulted to all events.
     
     - Returns: An `Observable` of `SAVDataEvent<Message>` specified to listen. This observable will never complete.
     */
    func connect(options: [SAVDataEventType]?) -> Observable<SAVDataEvent<Message>>
}
