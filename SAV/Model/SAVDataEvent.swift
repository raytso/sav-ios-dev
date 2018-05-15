//
//  SAVDataEvent.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/14.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation

struct SAVDataEvent<T> {
    var type: SAVDataEventType
    var value: T
}

enum SAVDataEventType {
    case add
    case change
    case remove
}
