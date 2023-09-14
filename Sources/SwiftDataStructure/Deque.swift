//
//  Deque.swift
//  
//
//  Created by 김민석 on 2023/09/14.
//

public struct Deque<T> {
    
    public init() { }
    
    private var leftArray: [T] = []
    private var rightArray: [T] = []
    private var leftIndex: Int = 0
    private var rightIndex: Int = 0
    
     public var isEmpty: Bool {
        return leftIndex + rightIndex >= leftArray.count + rightArray.count
    }
    
     public var size: Int {
        return (leftArray.count + rightArray.count) - (leftIndex + rightIndex)
    }
    
     public var front: T? {
        if isEmpty {
            return nil
        }
        
        if leftIndex >= leftArray.count {
            return rightArray[rightIndex]
        }
        
        return leftArray.last
    }
    
     public var back: T? {
        if isEmpty {
            return nil
        }
        
        if rightIndex >= rightArray.count {
            return leftArray[leftIndex]
        }
        
        return rightArray.last
    }
    
    mutating public func pushLeft(_ element: T) {
        leftArray.append(element)
    }
    
    mutating public func popLeft() -> T? {
        if isEmpty {
            return nil
        }
        
        if leftIndex >= leftArray.count {
            let element = rightArray[rightIndex]
            rightIndex += 1
            return element
        }
        
        return leftArray.popLast()
    }
    
    mutating public func pushRight(_ element: T) {
        rightArray.append(element)
    }
    
    mutating public func popRight() -> T? {
        if isEmpty {
            return nil
        }
        
        if rightIndex >= rightArray.count {
            let element = leftArray[leftIndex]
            leftIndex += 1
            return element
        }
        
        return rightArray.popLast()
    }
}

