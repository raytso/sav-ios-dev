//
//  SAVReference.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/12.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

protocol SAVDatabaseReferenceProtocol {
    func child(_ index: String) -> Self
    
    /**
     Retrieve the value under the current reference.
     
     - Returns: the current reference's value.
     */
    func get() -> Observable<[String: Any]?>
    
    /**
     Pushes the value under the current reference associated with a auto-created key.
     
     - parameter value: the data to push.
     
     - Returns: the auto created key.
     */
    func push(_ value: Any) -> Observable<String>
    
    /**
     Sets a value under the current reference.
     
     - parameter value: the data to set.
     
     - Returns: the key where the value is added.
     */
    func set(_ value: Any) -> Observable<String>
}

protocol SAVDatabaseQueryProtocol {
    
}

protocol SAVReference: SAVDatabaseReferenceProtocol, SAVDatabaseQueryProtocol { }
