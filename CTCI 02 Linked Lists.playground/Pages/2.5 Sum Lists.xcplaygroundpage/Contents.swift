//: [Previous](@previous)

import Foundation

//2.5
//Sum Lists: You have two numbers represented by a linked list, where each node contains a single digit. The digits are stored in reverse order, such that the 1's digit is at the head of the list. Write a function that adds the two numbers and returns the sum as a linked list.
//EXAMPLE
//Input: (7 -> 1 -> 6) + (5 -> 9 -> 2). That is, 617 + 295.
//Output: 2 -> 1 -> 9. That is, 912.
//FOLLOW UP
//Suppose the digits are stored in forward order. Repeat the above problem.
//EXAMPLE
//Input: (6 -> 1 -> 7) + (2 -> 9 -> 5). That is, 617 + 295.
//Output: 9 -> 1 -> 2. That is, 912.

class dNode<T: Equatable>: Node<T> {
    var prev: dNode<T>?
}

func sumListsWithBackwardLists(_ list1: LinkedList<Int>, _ list2: LinkedList<Int>) -> LinkedList<Int> {
    
    //One extra list is enough, thanks
    var listA = list1.head
    var listB = list2.head
    let returnList = LinkedList<Int>()
    var placeholderDigit = 0
    
    var sum = listA.key + listB.key
    let firstNode = Node<Int>()
    
    firstNode.key = sum % 10
    
    if sum >= 10 {
        placeholderDigit = sum / 10
    } else {
        placeholderDigit = 0
    }
    
    returnList.head = firstNode
    var newList = returnList.head
    
    guard listA.next != nil && listB.next != nil else {
        if placeholderDigit > 0 {
            let rollOverNode = Node(key: placeholderDigit)
            newList.next = rollOverNode
        }
        
        return returnList
    }
    
    listA = listA.next!
    listB = listB.next!
    
    
    //Sum both lists's digits in place and append it to the new list
    while listA.next != nil && listB.next != nil {
        let sum = listA.key + listB.key + placeholderDigit
        
        let newNode = Node(key: sum % 10)
        if sum >= 10 {
            placeholderDigit = sum / 10
        } else {
            placeholderDigit = 0
        }
        
        newList.next = newNode
        newList = newList.next!
        listA = listA.next!
        listB = listB.next!
    }
    
    //Follow up by summing the last two matching digits
    sum = listA.key + listB.key + placeholderDigit
    
    let newNode = Node(key: sum % 10)
    
    if sum >= 10 {
        placeholderDigit = sum / 10
    } else {
        placeholderDigit = 0
    }
    
    newList.next = newNode
    newList = newList.next!
    
    if listA.next != nil {
        listA = listA.next!
        
        while listA.next != nil {
            let sum = listA.key + placeholderDigit
            let newNode = Node(key: sum % 10)
            
            if sum >= 10 {
                placeholderDigit = sum / 10
            } else {
                placeholderDigit = 0
            }
            
            newList.next = newNode
            newList = newList.next!
            listA = listA.next!
        }
        
        let sum = listA.key + placeholderDigit
        let newNode = Node(key: sum % 10)
        
        newList.next = newNode
        
        if sum >= 10 {
            let oneNode = Node(key: 1)
            newList = newList.next!
            newList.next = oneNode
        }
    }
    
    if listB.next != nil {
        listB = listB.next!
        
        while listB.next != nil {
            let sum = listB.key + placeholderDigit
            let newNode = Node(key: sum)
            
            if sum >= 10 {
                placeholderDigit = sum / 10
            } else {
                placeholderDigit = 0
            }
            
            newList.next = newNode
            newList = newList.next!
            listB = listB.next!
        }
        
        let sum = listB.key + placeholderDigit
        let newNode = Node(key: sum)
        
        newList.next = newNode
        
        if sum >= 10 {
            let oneNode = Node(key: 1)
            newList = newList.next!
            newList.next = oneNode
        }
    }
    
    print("  ", terminator: "")
    list1.printAllKeys()
    print("+ ", terminator: "")
    list2.printAllKeys()
    print("----------")
    print("  ", terminator: "")
    returnList.printAllKeys()
    print()
    
    return returnList
}

//Takes two Linked Lists as input and returns a Doubly Linked List
//Taking two Doubly Linked Lists as input would definitely cut down on lines
func sumListsWithForwardLists(_ list1: LinkedList<Int>, _ list2: LinkedList<Int>) -> LinkedList<Int> {
    let listA = LinkedList<Int>()
    let listB = LinkedList<Int>()
    let listC = LinkedList<Int>()
    
    var currentNode1 = list1.head
    var currentNode2 = list2.head
    
    //The idea is to make new lists and pad the shorter list, if any, with zeroes at the front
    //We start here for the case if each list only has one Node
    if currentNode1.next == nil && currentNode2.next == nil {
        let sum = currentNode1.key + currentNode2.key
        let lonelyNode = dNode(key: sum % 10)
        
        listC.head = lonelyNode
        
        if sum >= 10 {
            let rollOverNode = dNode(key: sum / 10)
            rollOverNode.next = listC.head
            listC.head = rollOverNode
        }
        
        return listC
    } else {
        let nodeA = Node(key: currentNode1.key)
        let nodeB = Node(key: currentNode2.key)
        
        listA.head = nodeA
        listB.head = nodeB
        
        if currentNode1.next != nil {
            currentNode1 = currentNode1.next!
        }
        
        if currentNode2.next != nil {
            currentNode2 = currentNode2.next!
        }
    }
    
    var currentNodeA = listA.head
    var currentNodeB = listB.head
    
    while currentNode1.next != nil && currentNode2.next != nil {
        let nodeA = Node(key: currentNode1.key)
        let nodeB = Node(key: currentNode2.key)
        
        currentNode1 = currentNode1.next!
        currentNode2 = currentNode2.next!
        currentNodeA.next = nodeA
        currentNodeB.next = nodeB
        currentNodeA = currentNodeA.next!
        currentNodeB = currentNodeB.next!
    }
    
    let nodeA = Node(key: currentNode1.key)
    let nodeB = Node(key: currentNode2.key)
    
    currentNodeA.next = nodeA
    currentNodeB.next = nodeB
    currentNodeA = currentNodeA.next!
    currentNodeB = currentNodeB.next!
    
    if currentNode1.next != nil {
        currentNode1 = currentNode1.next!
        var firstNodeB = listB.head
        
        while currentNode1.next != nil {
            let nodeA = Node(key: currentNode1.key)
            let zeroNode = Node(key: 0)
            
            currentNode1 = currentNode1.next!
            currentNodeA.next = nodeA
            currentNodeA = currentNodeA.next!
            zeroNode.next = firstNodeB
            firstNodeB = zeroNode
        }
        
        let nodeA = Node(key: currentNode1.key)
        let zeroNode = Node(key: 0)
        currentNodeA.next = nodeA
        zeroNode.next = firstNodeB
        firstNodeB = zeroNode
        listB.head = firstNodeB
    }
    
    if currentNode2.next != nil {
        currentNode2 = currentNode2.next!
        var firstNodeA = listA.head
        
        while currentNode2.next != nil {
            let nodeB = Node(key: currentNode2.key)
            let zeroNode = Node(key: 0)
            
            currentNode2 = currentNode2.next!
            currentNodeB.next = nodeB
            currentNodeB = currentNodeB.next!
            zeroNode.next = firstNodeA
            firstNodeA = zeroNode
        }
        
        let nodeB = Node(key: currentNode2.key)
        let zeroNode = Node(key: 0)
        currentNodeB.next = nodeB
        zeroNode.next = firstNodeA
        firstNodeA = zeroNode
        listA.head = firstNodeA
    }
    
    //Do the math
    listA.printAllKeys()
    listB.printAllKeys()
    print("______________")
    
    currentNodeA = listA.head
    currentNodeB = listB.head
    
    let headDNode = dNode<Int>()
    
    listC.head = headDNode
    var sum = currentNodeA.key + currentNodeB.key
    var currentNodeC = headDNode
    
    headDNode.key = sum
    
    guard currentNodeA.next != nil && currentNodeB.next != nil else { return listC }
    
    currentNodeA = currentNodeA.next!
    currentNodeB = currentNodeB.next!
    
    while currentNodeA.next != nil && currentNodeB.next != nil {
        let sum = currentNodeA.key + currentNodeB.key
        
        let nodeC = dNode(key: sum)
        currentNodeC.next = nodeC
        nodeC.prev = currentNodeC
        currentNodeC = nodeC
        
        currentNodeA = currentNodeA.next!
        currentNodeB = currentNodeB.next!
    }
    
    sum = currentNodeA.key + currentNodeB.key
    
    let nodeC = dNode(key: sum)
    
    currentNodeC.next = nodeC
    nodeC.prev = currentNodeC
    currentNodeC = nodeC
    
    // Turn the nodes into single digits
    var rollOverNum = 0
    
    while currentNodeC.prev != nil {
        
        currentNodeC.key = currentNodeC.key + rollOverNum
        
        if currentNodeC.key >= 10 {
            rollOverNum = currentNodeC.key / 10
            currentNodeC.key = currentNodeC.key % 10
        } else {
            rollOverNum = 0
        }
        
        currentNodeC = currentNodeC.prev!
    }
    
    currentNodeC.key = currentNodeC.key + rollOverNum
    
    if currentNodeC.key >= 10 {
        rollOverNum = currentNodeC.key / 10
        currentNodeC.key = currentNodeC.key % 10
        
        let rollOverNode = dNode(key: rollOverNum)
        currentNodeC.prev = rollOverNode
        rollOverNode.next = currentNodeC
        listC.head = rollOverNode
    }
    
    listC.printAllKeys()
    print()
    
    return listC
}

//Testing to try and break my code
let list1 = LinkedList(head: Node(key: 1))
list1.append(element: 2)
list1.append(element: 4)
list1.append(element: 9)
//list1.append(element: 3)
//list1.append(element: 3)

let list2 = LinkedList(head: Node(key: 9))
list2.append(element: 5)
list2.append(element: 7)

let list3 = sumListsWithBackwardLists(list1, list2)

let list4 = sumListsWithForwardLists(list1, list2)

let list5 = LinkedList(head: Node(key: 9))
list5.append(element: 9)
list5.append(element: 4)
list5.append(element: 9)
list5.append(element: 9)

let list6 = LinkedList(head: Node(key: 5))
list6.append(element: 4)
list6.append(element: 9)

let list7 = sumListsWithForwardLists(list5, list6)

let smallNode = Node(key: 8)
smallNode.next = Node(key: 2)
let tinyList1 = LinkedList(head: smallNode)
let tinyList2 = LinkedList(head: Node(key: 9))

let sum1 = sumListsWithBackwardLists(tinyList1, tinyList2)
let sum2 = sumListsWithForwardLists(tinyList1, tinyList2)

print("sum1", terminator: ": ")
sum1.printAllKeys()
print("\nsum2", terminator: ": ")
sum2.printAllKeys()

//FIXME: Matching a 1N LL with 2N LL breaks sumListsWithForwardLists(_:_:)

//: [Next](@next)
