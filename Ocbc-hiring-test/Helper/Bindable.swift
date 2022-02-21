//
//  Bindable.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 19/02/22.
//

import Foundation


final class Bindable<T> {
    typealias Observer = (T) -> ()
    var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ observer: Observer?) {
        self.observer = observer
        observer?(value)
    }
    
}
