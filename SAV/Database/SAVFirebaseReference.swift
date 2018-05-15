//
//  SAVFirebaseReference.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/13.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import FirebaseDatabase
import RxSwift

class SAVFirebaseReference: SAVReference {
    private let disposeBag = DisposeBag()
    
    // MARK: - Properties
    
    private var ref: DatabaseReference = Database.database().reference()
    
    private enum FirebaseReferenceError: Error {
        case failedToPush(String)
    }
    
    // MARK: - SAVReference protocol
    
    func child(_ index: String) -> Self {
        ref = ref.child(index)
        return self
    }
    
    func get() -> Observable<Any?> {
        return Observable.create { [ref] observer in
            ref.observe(.value, with: { (snapshot) in
                observer.onNext(snapshot.value)
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
    
    func push(_ value: Any) -> Observable<String> {
        ref = ref.childByAutoId()
        return set(value)
    }
    
    func set(_ value: Any) -> Observable<String> {
        return Observable.create { [weak self] observer in
            self?.ref.setValue(value) { (error, databaseRef) in
                if let error = error {
                    observer.onError(FirebaseReferenceError.failedToPush("\(error)"))
                } else {
                    observer.onNext(databaseRef.key)
                }
            }
            return Disposables.create()
        }
    }
    
    func listen(for events: [SAVDataEventType]) -> Observable<SAVDataEvent<Any>> {
        return Observable.create { [weak self] observer in
            events.forEach { (event) in
                self?.ref.observe(event.firbaseDataEventType, with: { (snapshot) in
                    guard let value = snapshot.value else { return }
                    observer.onNext(SAVDataEvent<Any>(type: event, value: value))
                })
            }
            return Disposables.create()
        }
    }
}

private extension SAVDataEventType {
    var firbaseDataEventType: DataEventType {
        switch self {
        case .add:
            return .childAdded
        case .change:
            return .childChanged
        case .remove:
            return .childRemoved
        }
    }
}
