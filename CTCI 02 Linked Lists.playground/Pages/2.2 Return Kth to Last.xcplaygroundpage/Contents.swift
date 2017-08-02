//: [Previous](@previous)

import Foundation

//2.2
//Return Kth to Last: Implement an algorithm to find the kth to last element of a singly linked list.

extension LinkedList {
    func kthToLast(_ pos: Int) -> T? {
        var currentNode = head
        var counter = 0
        
        while currentNode.next != nil {
            counter += 1
            
            currentNode = currentNode.next!
        }
        
        var difference = counter - pos
        guard difference >= 0 else { return nil }
        
        currentNode = head
        
        while difference > 0 {
            currentNode = currentNode.next!
            difference -= 1
        }
        
        return currentNode.key
    }
}

let list = LinkedList<Int>()
list.append(element: 1)
list.append(element: 2)
list.append(element: 3)
list.append(element: 4)
list.append(element: 5)

list.kthToLast(5)
list.kthToLast(0)
list.kthToLast(1)

//: [Next](@next)
