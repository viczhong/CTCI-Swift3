//: [Previous](@previous)

import Foundation

//2.1
//Remove Dups: Write code to remove duplicates from an unsorted linked list.
//FOLLOW UP
//How would you solve this problem if a temporary buffer is not allowed?

extension LinkedList where T: Hashable {
    func removeDups() {
        let list = head
        var currentNode = list
        
        var set = Set<T>()
        
        while currentNode.next != nil {
            set.insert(currentNode.key)
            
            if set.contains(currentNode.next!.key) {
                if currentNode.next?.next != nil {
                    currentNode.next = currentNode.next!.next!
                } else {
                    currentNode.next = nil
                }
            } else {
                currentNode = currentNode.next!
            }
        }
    }
}

let list = LinkedList<Int>()
list.append(element: 5)
list.append(element: 4)
list.append(element: 3)
list.append(element: 3)
list.append(element: 5)

list.removeDups()
list.printAllKeys()

//: [Next](@next)
