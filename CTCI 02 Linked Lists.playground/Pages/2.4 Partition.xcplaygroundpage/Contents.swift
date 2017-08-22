//: [Previous](@previous)

import Foundation

//2.4
//Partition: Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. lf x is contained within the list, the values of x only need to be after the elements less than x (see below).The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
//EXAMPLE
//Input: 3 -> 5 -> 8 -> 5 -> 10 -> 2 -> 1 [partition = 5]
//Output: 3 -> 1 -> 2 -> 10 -> 5 -> 5 -> 8

extension LinkedList where T: Comparable {
    func partition(_ num: T) {
        var currentNode = head
        var previousNode = currentNode
        var partition = currentNode
        
        if currentNode.next != nil {
            currentNode = currentNode.next!
            
            
            while currentNode.next != nil {
                if currentNode.key >= num {
                    previousNode = currentNode
                    currentNode = currentNode.next!
                } else {
                    previousNode.next = currentNode.next!
                    
                    
                    currentNode.next = partition
                    partition = currentNode
                    
                    currentNode = previousNode.next!
                }
            }
            
            if currentNode.key < num {
                previousNode.next = nil
                currentNode.next = partition
                partition = currentNode
            }
            
            head = partition
        }
    }
}

let list = LinkedList<Int>()

for _ in 0...10 {
    list.append(element: Int(arc4random_uniform(10)) + 1)
}

list.printAllKeys()
list.partition(5)
list.printAllKeys()

//: [Next](@next)
