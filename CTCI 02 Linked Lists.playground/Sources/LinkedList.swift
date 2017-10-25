import Foundation

open class LinkedList<T: Equatable> {
  public var head  = Node<T>()
    
    public init() {}
    
    public init(head: Node<T>) {
        self.head = head
    }
    
    public func printAllKeys() {
        var currentNode = head
        while currentNode.next != nil {
            print(currentNode.key, terminator: " ")
            currentNode = currentNode.next!
        }
        print(currentNode.key!)
    }
    
    public var count: Int {
        if head.key == nil {
            return 0
        }
        var counter = 1
        var currentNode = head
        while currentNode.next != nil {
            counter += 1
            currentNode = currentNode.next!
        }
        return counter
    }
    
    public func append(element newKey: T) {
        if head.key == nil {
            head.key = newKey
        } else {
            var currentNode = head
            while currentNode.next != nil {
                currentNode = currentNode.next!
            }
            let newNode = Node<T>()
            newNode.key = newKey
            currentNode.next = newNode
        }
    }
    
    public func getElement(at Index: Int) -> Node<T>? {
        var currentNode = head
        var counter = 0
        while counter < Index {
            if currentNode.next != nil {
                currentNode = currentNode.next!
                counter += 1
            } else {
                return nil
            }
        }
        return currentNode
    }
    
    public func insert(_ key: T, at index: Int) {
        var currentNode = head
        var counter = 1
        while counter < index {
            currentNode = currentNode.next!
            counter += 1
        }
        
        let newNode = Node<T>()
        newNode.key = key
        newNode.next = currentNode.next
        currentNode.next = newNode
    }
    
    public func contains(element targetKey: T) -> Bool {
        guard head.key != nil else { return false }
        var currentNode = head
        while currentNode.next != nil {
            if currentNode.key == targetKey {
                return true
            }
            currentNode = currentNode.next!
        }
        if currentNode.key == targetKey {
            return true
        } else {
            return false
        }
    }
    
    public func remove(at index: Int) {
        var currentNode = head
        var counter = 1
        while counter <= index {
            currentNode = currentNode.next!
            counter += 1
        }
        if currentNode.next != nil {
            currentNode.key = currentNode.next!.key
        } else {
            currentNode.key = nil
        }
    }
    
    public func reverse() {
        var previousNode: Node<T>? = nil
        var currentNode: Node<T>? = head
        while currentNode != nil {
            let temp = currentNode!.next
            
            currentNode!.next = previousNode
            previousNode = currentNode
            currentNode = temp
        }
        self.head = previousNode!
    }
}

extension LinkedList: Equatable {
    public static func ==(lhs: LinkedList<T>, rhs: LinkedList<T>) -> Bool {
        var currentNodeLeft = lhs.head
        var currentNodeRight = rhs.head
        while currentNodeLeft.next != nil && currentNodeRight.next != nil {
            guard currentNodeLeft.key == currentNodeRight.key else { return false }
            currentNodeLeft = currentNodeLeft.next!
            currentNodeRight = currentNodeRight.next!
        }

        guard currentNodeLeft.key == currentNodeRight.key else { return false }
        guard currentNodeLeft.next == nil && currentNodeRight.next == nil else { return false }

        return true
    }
}
