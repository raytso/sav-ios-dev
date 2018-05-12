//
//  SAVReference.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/12.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation

protocol SAVDatabaseReferenceProtocol {
    func child(_ index: String) -> Self
    func get(result: @escaping ([String : Any]?) -> Void)
    func push() -> Self
}

protocol SAVDatabaseQueryProtocol {
    
}

protocol SAVReference: SAVDatabaseReferenceProtocol, SAVDatabaseQueryProtocol { }
