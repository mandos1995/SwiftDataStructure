//
//  Queue.swift
//  
//
//  Created by 김민석 on 2023/09/13.
//

public struct Queue<T> {
    private var array: [T] = []
    private var index: Int = 0
    
    public var top: T? {
        return self.isEmpty ? nil : array[index]
    }
    
    public var isEmpty: Bool {
        return array.count - index <= 0
    }
    
    public var count: Int {
        return array.count - index
    }
    
    mutating public func push(_ element: T) {
        array.append(element)
    }
    
    mutating public func pop() -> T? {
        guard !self.isEmpty else {
            return nil
        }
        let element = array[index]
        index += 1
        return element
    }
}
