//: [Previous](@previous)

import Foundation

//2.1
//Remove Dups: Write code to remove duplicates from an unsorted linked list.
//FOLLOW UP
//How would you solve this problem if a temporary buffer is not allowed?

extension LinkedList where T: Hashable {
    func removeDupsWithTempBuffer() {
        var currentNode = head
        
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
    
    func removeDupsWithoutTempBuffer() {
        var currentNode = head
        
        while currentNode.next != nil {
            var seekerNode = currentNode.next!
            var previousNode = currentNode
            
            while seekerNode.next != nil {
                
                if currentNode.key == seekerNode.key {
                    previousNode.next = seekerNode.next
                    seekerNode = seekerNode.next!
                } else {
                    previousNode = seekerNode
                    seekerNode = seekerNode.next!
                }
                
                if currentNode.key == seekerNode.key {
                    previousNode.next = nil
                }
            }
            
            currentNode = currentNode.next!
        }
    }
}

let list = LinkedList<Int>()

for _ in 0...10 {
    list.append(element: Int(arc4random_uniform(5)) + 1)
}

list.printAllKeys()
list.removeDupsWithoutTempBuffer()
list.printAllKeys()

//: [Next](@next)
