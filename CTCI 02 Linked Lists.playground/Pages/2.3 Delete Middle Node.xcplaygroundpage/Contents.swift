//: [Previous](@previous)

import Foundation

//2.3
//Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but the first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
//EXAMPLE
//Input: the node c from the linked list a -> b -> c -> d -> e -> f
//Result: nothing is returned, but the new linked list looks like a -> b -> d -> e -> f

extension LinkedList {
    func deleteMiddle() {
        var currentNode = head
        var counter = 1
        
        while currentNode.next != nil {
            counter += 1
            currentNode = currentNode.next!
        }
        
        guard counter >= 3 else { return }
        
        counter = counter / 2
        currentNode = head
        
        while counter > 1 {
            counter -= 1
            currentNode = currentNode.next!
        }
        
        currentNode.next = currentNode.next?.next
    }
}

let list = LinkedList<Int>()
list.append(element: 1)
list.append(element: 2)
list.append(element: 3)
list.append(element: 4)
list.append(element: 5)

list.printAllKeys()
list.deleteMiddle()
list.printAllKeys()
list.deleteMiddle()
list.printAllKeys()
list.deleteMiddle()
list.printAllKeys()
list.deleteMiddle()
list.printAllKeys()

//: [Next](@next)
