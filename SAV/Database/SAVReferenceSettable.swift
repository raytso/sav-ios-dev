//
//  SAVReferenceSettable.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/13.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

protocol SAVReferenceSettable {
    associatedtype SetItemType
    func set(_ payload: SetItemType) -> Observable<String>
    init(targetRef: SAVReference)
}
