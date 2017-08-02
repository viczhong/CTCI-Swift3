//: [Previous](@previous)

import Foundation

//1.2
//Check Permutation: Given two strings, write a method to decide if one is a permutation of the other.

func checkPermutation(_ a: String, _ b: String) -> Bool {
    var dict = [Character : Int]()
    
    for c in a.characters {
        if dict[c] != nil {
            dict[c] = dict[c]! + 1
        } else {
            dict[c] = 1
        }
    }
    
    for c in b.characters {
        if dict[c] != nil {
            dict[c] = dict[c]! - 1
            
            guard dict[c]! > -1 else { return false }
        } else {
            return false
        }
    }
    
    for v in dict.values where v != 0 {
        return false
    }
    
    return true
}

assert(checkPermutation("abc", "bca") == true, "1.2 failed")
assert(checkPermutation("abc", "bcad") == false, "1.2 failed")

//: [Next](@next)
