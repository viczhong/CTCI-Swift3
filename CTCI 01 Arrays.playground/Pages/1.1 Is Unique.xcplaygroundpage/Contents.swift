//: Playground - noun: a place where people can play

import UIKit

//1.1
//Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

func isUnique(_ s: String) -> Bool {
    var dict = [Character : Int]()
    
    for char in s.characters {
        if dict[char] != nil {
            return false
        } else {
            dict[char] = 1
        }
    }
    
    return true
}

assert(isUnique("abcd") == true, "1.1 failed")
assert(isUnique("abcdd") == false, "1.1 failed")

func isUniqueNoDataStructures(_ s: String) -> Bool {
    
    for x in 0..<s.characters.count - 1 {
        for y in x + 1..<s.characters.count {
            if (s[s.index(s.startIndex, offsetBy: x)] == s[s.index(s.startIndex, offsetBy: y)]) {
                return false
            }
        }
    }
    
    return true
}

assert(isUniqueNoDataStructures("abcd") == true, "1.1a failed")
assert(isUniqueNoDataStructures("abcdd") == false, "1.1a failed")

//: [Next](@next)
