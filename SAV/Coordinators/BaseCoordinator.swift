//
//  Coordinator.swift
//  SAV
//
//  Created by Ray Tso on 2018/4/22.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

class BaseCoordinator<ResultType>: Coordinator {
    let disposeBag = DisposeBag()

    private var nextCoordinator: Any?
    
    private func store<T>(coordinator: BaseCoordinator<T>) {
        self.nextCoordinator = coordinator
    }
    
    private func free<T>(coordinator: BaseCoordinator<T>) {
        self.nextCoordinator = nil
    }
    
    func coordinate<T>(to coordinator: BaseCoordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in
                self?.free(coordinator: coordinator)
            })
    }
    
    func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
}
