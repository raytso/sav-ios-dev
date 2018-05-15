//
//  MessageReceiverImpl.swift
//  SAV
//
//  Created by Ray Tso on 2018/5/14.
//  Copyright © 2018 Ray Tso. All rights reserved.
//

import Foundation
import RxSwift

class MessageReceiverImpl: MessageReceiver {
    private let disposeBag = DisposeBag()
    
    // MARK: - Properties
    
    private let ref: SAVReference
    
    // MARK: - MessageReceiver protocol
    
    func getLast(_ amount: Int) -> Observable<[Message]> {
        return .empty()
    }
    
    func connect(options: [SAVDataEventType]? = [.add, .change, .remove]) -> Observable<SAVDataEvent<Message>> {
        return self.get(options: options)
    }
    
    // MARK: - Initialization
    
    required init(targetRef: SAVReference) {
        self.ref = targetRef
    }
}

extension MessageReceiverImpl: SAVReferenceReceivable {
    typealias ReceiveItemType = Message
    
    func get(options: [SAVDataEventType]?) -> Observable<SAVDataEvent<Message>> {
        guard let options = options else { return .empty() }
        return self.ref.listen(for: options)
            .map { event -> SAVDataEvent<Message>? in
                guard let message = event.value as? Message else { return nil }
                return SAVDataEvent<Message>(type: event.type, value: message)
            }
            .flatMap { Observable.from(optional: $0) }
    }
}
