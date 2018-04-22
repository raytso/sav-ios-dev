//
//  Coordinator.swift
//  SAV
//
//  Created by Ray Tso on 2018/4/22.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

protocol Coordinator {
    associatedtype ResultType
    func coordinate(to coordinator: BaseCoordinator<ResultType>) -> Observable<ResultType>
    func start() -> Observable<ResultType>
}
