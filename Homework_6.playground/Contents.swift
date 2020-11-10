import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

class Queue<T>: CustomStringConvertible {
    
    var description: String {
        var desc = ""
        
        for (index, element) in elements.enumerated() {
            desc += index == elements.count - 1 ? "\(element)" : "\(element), "
        }
        
        return desc
    }
    
    var count: Int {
        return elements.count
    }
    
    private var elements: [T] = []
    
    subscript(index: Int) -> T? {
        guard index >= 0, index < elements.count else {
            return nil
        }
        
        return elements[index]
    }
    
    func enqueue(_ value: T) {
        elements.append(value)
    }
    
    func dequeue() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        
        return elements.removeFirst()
    }
    
    func filter(predicate: (T) -> Bool) -> [T] {
        var result: [T] = []
        
        for element in elements {
            if predicate(element) {
                result.append(element)
            }
        }
        
        return result
    }
    
    func max(predicate: (T, T) -> Bool) -> T? {
        guard elements.count > 0 else {
            return nil
        }
        
        var max = elements[0]
        for element in elements {
            if predicate(element, max) {
                max = element
            }
        }
        
        return max
    }
    
    func min(predicate: (T, T) -> Bool) -> T? {
        guard elements.count > 0 else {
            return nil
        }
        
        var min = elements[0]
        for element in elements {
            if predicate(element, min) {
                min = element
            }
        }
        
        return min
    }
}

var queue = Queue<Int>()
//enqueue test
queue.enqueue(12)
queue.enqueue(25)
queue.enqueue(-29)
queue.enqueue(1)
queue.enqueue(56)
print(queue)

//dequeue test
print(queue.dequeue()!)
print(queue.dequeue()!)
print(queue.dequeue()!)
print(queue)

//closures test
queue.enqueue(129)
queue.enqueue(400)
queue.enqueue(201)
let filterArray = queue.filter { $0 > 100 }
print(filterArray)

if let max = queue.max(predicate: { $0 > $1 }) {
    print("Max: \(max)")
}

if let min = queue.min(predicate: { $0 < $1 }) {
    print("Min: \(min)")
}

//subscript test
for index in 0..<queue.count {
    if let element = queue[index] {
        print("Element: \(element)")
    }
}
