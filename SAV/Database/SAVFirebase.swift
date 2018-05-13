//
//  SAVFirebase.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/12.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation

class SAVFirebase: SAVDatabase, SAVDatabaseRef {
    var databaseRef: SAVReference = SAVFirebaseReference()
    
    var liveMatches: SAVReference {
        return databaseRef.child("liveMatches")
    }
    
    var matches: SAVReference {
        return databaseRef.child("matches")
    }
    
    var chatrooms: SAVReference {
        return databaseRef.child("chatrooms")
    }
    
    var users: SAVReference {
        return databaseRef.child("users")
    }
    
}
