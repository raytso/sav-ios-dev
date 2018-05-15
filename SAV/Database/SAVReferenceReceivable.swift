//
//  SAVReferenceReceivable.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/14.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

protocol SAVReferenceReceivable {
    associatedtype ReceiveItemType
    func get(options: [SAVDataEventType]?) -> Observable<SAVDataEvent<ReceiveItemType>>
    init(targetRef: SAVReference)
}
