//
//  Heap.swift
//  
//
//  Created by 김민석 on 2023/09/14.
//

public struct Heap<T: Comparable> {
    private var elements: [T] = []
    private let comparer: (T, T) -> Bool
    
    public var isEmpty: Bool {
        return elements.count <= 1
    }
    
    public var top: T? {
        return isEmpty ? nil : elements[1]
    }
    
    /// ex) let heap = Heap<Int>(compare: <)
    /// heap = minHeap
    /// - Parameter comparer: 어떤 value로 비교하여 힙을 만들 것인지
    public init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating public func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        elements.append(element)
        swimUp(index: elements.count - 1)
    }
    
    mutating private func swimUp(index: Int) {
        var index = index
        while index > 1 && comparer(elements[index], elements[index / 2]) {
            elements.swapAt(index, index / 2)
            index /= 2
        }
    }
    
    mutating public func pop() -> T? {
        if elements.count < 2 { return nil }
        elements.swapAt(1, elements.count - 1)
        let deletedElement = elements.removeLast()
        diveDown(index: 1)
        return deletedElement
    }
    
    mutating private func diveDown(index: Int) {
        var swapIndex = index
        var isSwap = false
        let leftIndex = index * 2
        let rightIndex = index * 2 + 1

        if leftIndex < elements.endIndex && comparer(elements[leftIndex], elements[swapIndex]) {
            swapIndex = leftIndex
            isSwap = true
        }
        
        if rightIndex < elements.endIndex && comparer(elements[rightIndex], elements[swapIndex]) {
            swapIndex = rightIndex
            isSwap = true
        }

        if isSwap {
            elements.swapAt(swapIndex, index)
            diveDown(index: swapIndex)
        }
    }
}
