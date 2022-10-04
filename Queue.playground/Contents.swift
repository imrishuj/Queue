import UIKit

var array1 = [2,9,0,6,8,10]

public class QueueUsingArray<T> {
    
    var element: [T] = []
    
    public init() {}
    
    public var isEmpty: Bool {
        return element.isEmpty ? true : false
    }
    
    public func display() {
        guard !isEmpty else { return }
        var firstIndex = 0
        while (firstIndex < self.element.count) {
            print(self.element[firstIndex] as Any, terminator : "  ")
            firstIndex += 1
        }
    }
    
    public func enqueue(_ value: T) {
        element.append(value)
    }
    
    public func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return element.removeFirst()
    }
}

/* Create and fetch queue using array */

func createAndFetchQueueUsingArray(array: [Int]) -> QueueUsingArray<Int> {
    var firstIndex = 0
    let lastIndex = array.count
    let queue = QueueUsingArray<Int>()
    while (firstIndex < lastIndex) {
        queue.enqueue(array[firstIndex])
        firstIndex += 1
    }
    return queue
}

//let queue1 = createAndFetchQueueUsingArray(array: array1)
//print(queue1.isEmpty)
//print(queue1.display())
//print("Enqueue", queue1.enqueue(4) as Any, queue1.display())
//print("Dequeue", queue1.dequeue() as Any, queue1.display())

public class QueueListNode<T>  {
    
    public var data: T
    public var next: QueueListNode?
    
    public init(_ data: T, _ next: QueueListNode? = nil) {
        self.data = data
        self.next = next
    }
}

public class QueueUsingList<T> {
    
    var front: QueueListNode<T>?
    var rear: QueueListNode<T>?
    
    public init() {}
    
    var isEmpty : Bool {
        return front == nil
    }
    
    public func display() {
        guard !isEmpty else { return }
        var node = front
        while (node != nil) {
            print(node?.data as Any, terminator : "  ")
            node = node?.next
        }
    }
    
    public func enqueue(_ value: T) {
       let newNode = QueueListNode(value, nil)
        if front == nil {
            front = newNode
            rear = newNode
        } else {
            rear?.next = newNode
            rear = newNode
        }
    }
    
    public func dequeue() -> T? {
        guard !isEmpty else { return -1 as? T }
        var node = front
        front = front?.next
        let data = node?.data
        node = nil
        return data
    }
}

/* Create and fetch queue using List */

func createAndFetchQueueUsingList(array: [Int]) -> QueueUsingList<Int> {
    var firstIndex = 0
    let lastIndex = array.count
    let queue = QueueUsingList<Int>()
    while (firstIndex < lastIndex) {
        queue.enqueue(array[firstIndex])
        firstIndex += 1
    }
    return queue
}

//let queue1 = createAndFetchQueueUsingList(array: array1)
//print(queue1.isEmpty)
//print(queue1.display())
//print("Enqueue", queue1.enqueue(4) as Any, queue1.display())
//print("Dequeue", queue1.dequeue() as Any, queue1.display())

public class QueueUsingTwoStack<T> {
    
    var left: [T] = []
    var right: [T] = []
    
    public init() {}
    
    var isEmpty : Bool {
        return left.isEmpty && right.isEmpty
    }
    
    public func display() {
        guard !isEmpty else { return }
        var element: [T] = []
        element.append(contentsOf: right.reversed())
        element.append(contentsOf: left)
        var firstIndex = 0
        while (firstIndex < element.count) {
            print(element[firstIndex] as Any, terminator : "  ")
            firstIndex += 1
        }
    }
    
    public func enqueue(_ value: T) {
        left.append(value)
    }
    
    public func dequeue() -> T? {
        guard !isEmpty else { return -1 as? T }
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        let data = right.removeLast()
        return data
    }
}

/* Create and fetch queue using Stack */

func createAndFetchQueueUsingStack(array: [Int]) -> QueueUsingTwoStack<Int> {
    var firstIndex = 0
    let lastIndex = array.count
    let queue = QueueUsingTwoStack<Int>()
    while (firstIndex < lastIndex) {
        queue.enqueue(array[firstIndex])
        firstIndex += 1
    }
    return queue
}

//let queue1 = createAndFetchQueueUsingStack(array: array1)
//print(queue1.display())
//print("Enqueue", queue1.enqueue(4) as Any, queue1.display())
//print("Dequeue", queue1.dequeue() as Any, queue1.display())

public class CircularQueue<T> {
    public var element : [T?]
    public var front = -1
    public var rear = -1
    
    public init(_ count: Int) {
        self.element = Array(repeating: nil, count: count)
    }
    
    var isEmpty: Bool {
        return front == -1 && rear == -1
    }
    
    var isFull: Bool {
        return (front ==  (rear + 1) % element.count)
    }
        
    public func display() {
        guard !isEmpty else { return }
        var firstIndex = 0
        while (firstIndex < element.count) {
            print(element[firstIndex] as Any, terminator : "  ")
            firstIndex += 1
        }
    }
    
    public func enqueue(_ value: T) {
        guard !isFull else { return }
        if front == -1 && rear == -1 {
            element[0] = value
            front = 0
            rear = 0
        } else {
            rear =  (rear + 1) % element.count
            element[rear] = value
        }
    }
    
    public func dequeue() -> T? {
        guard !isEmpty else { return -1 as? T }
        let data = element[front]
        if front == rear {
            front = -1
            rear = -1
            element[0] = nil
            return data
        } else {
            element[front] = nil
            front = (front + 1) % element.count
        }
        return data
    }
}

/* Create and fetch queue using Stack */

func createAndFetchCircularQueue(array: [Int]) -> CircularQueue<Int> {
    var firstIndex = 0
    let lastIndex = array.count
    let queue = CircularQueue<Int>(array.count)
    while (firstIndex < lastIndex) {
        queue.enqueue(array[firstIndex])
        firstIndex += 1
    }
    return queue
}

//let circularQueue = createAndFetchQueueUsingStack(array: array1)
//print(circularQueue.display())
//print("Enqueue", circularQueue.enqueue(4) as Any, circularQueue.display())
//print("Dequeue", circularQueue.dequeue() as Any, circularQueue.display())
