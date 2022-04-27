//
//  Box.swift
//  AppMVVM
//
//  Created by Igor on 27.02.2022.
//

// Generic class
// класс можно использовать для любого типа
class Box<T> {
    typealias Listener = (T) -> Void
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    var listener: Listener?
    
    init(_ value: T) {
        self.value = value
    }
    
    // убегающее замыкание, так как возвращение в другой контекст
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
