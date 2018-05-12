//
//  SAVFirebase.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/12.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import FirebaseDatabase
import RxSwift

class SAVFirebaseReference: SAVReference {
    private let disposeBag = DisposeBag()
    private var ref: DatabaseReference = Database.database().reference()
    
    func child(_ index: String) -> Self {
        ref = ref.child(index)
        return self
    }
    
    func get(result: @escaping ([String : Any]?) -> Void) {
        self.get()
            .subscribe(onNext: { (data) in
                result(data)
            })
            .disposed(by: disposeBag)
    }
    
    func push() -> Self {
        ref = ref.childByAutoId()
        return self
    }
    
    private func get() -> Observable<[String: Any]?> {
        return Observable.create { [ref] observer in
            ref.observe(.value, with: { [weak self] (snapshot) in
                observer.onNext(self?.convert(snapshot))
                observer.onCompleted()
            })
            return Disposables.create()
        }
    }
    
    private func convert(_ snapshot: DataSnapshot) -> [String: Any]? {
        guard let value = snapshot.value else { return nil }
        return [snapshot.key: value]
    }
}

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
