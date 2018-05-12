//
//  SAVDatabase.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/12.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation

protocol SAVDatabase {
    var liveMatches: SAVReference { get }
    var matches: SAVReference { get }
    var chatrooms: SAVReference { get }
    var users: SAVReference { get }
}

protocol SAVDatabaseRef {
    var databaseRef: SAVReference { get }
}
