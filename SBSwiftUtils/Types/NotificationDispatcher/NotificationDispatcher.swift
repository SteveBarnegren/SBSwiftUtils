//
//  NotificationDispatcher.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 06/06/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import Foundation

private class ObserverStore<T> {
    private(set) var observers = NDWeakObjectSet<T>()
    
    func add(observer: T) {
        observers.insert(object: observer)
    }
}

/// Used to broadcast notifications between distant types. Usage is similar to
/// NSNotificationCenter, although receiving messages relies of conforming to a
/// protocol. This enables types to send structured and type safe data through the
/// methods and parameters defined by the protocol.
public final class NotificationDispatcher {
    
    public static let shared = NotificationDispatcher()
    
    var stores = [String: Any]()
    
    public init() {}
    
    public func register<T>(observer: AnyObject, as observerType: T.Type) {
        
        guard let observer = observer as? T else {
            return
        }

        let key = String(describing: observerType)
        
        let store: ObserverStore<T>
        
        if let existingStore = stores[key] as? ObserverStore<T> {
            store = existingStore
        } else {
            store = ObserverStore<T>()
            stores[key] = store
        }
        
        store.add(observer: observer)
    }
    
    public func notify<T>(_ observerType: T.Type, handler: (T) -> Void) {
        
        let key = String(describing: observerType)
        
        guard let store = stores[key] as? ObserverStore<T> else {
            return
        }

        store.observers.forEach(handler)
    }
}
