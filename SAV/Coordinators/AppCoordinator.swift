//
//  AppCoordinator.swift
//  SAV
//
//  Created by Ray Tso on 2018/4/22.
//  Copyright © 2018 Ray Tso. All rights reserved.
//


import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Observable<Void> {
        return .empty()
    }
}
