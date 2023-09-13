//
//  File.swift
//  
//
//  Created by 김민석 on 2023/09/13.
//

public struct Stack<T> {
    
    public init() { }
    
    private var array: [T] = []
    
    public var top: T? {
        return array.last
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    mutating public func push(_ element: T) {
        array.append(element)
    }
    
    mutating public func pop() -> T? {
        return array.popLast()
    }
}



