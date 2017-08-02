//: [Previous](@previous)

import Foundation

//1.5
//One Away: There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.
//EXAMPLE
//pale, ple -> true
//pales, pale -> true
//pale, bale -> true
//pale, bake -> false

func oneAway(_ a: String, _ b: String) -> Bool {
    if a.characters.count == b.characters.count {
        return checkReplace(a, b)
    }
    
    if abs(a.characters.count - b.characters.count) == 1 {
        return checkAddOrSub(a, b)
    }
    
    return false
}

func checkReplace(_ a: String, _ b: String) -> Bool {
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
        } else {
            dict[c] = 1
        }
    }
    
    var returnArr = [Int]()
    
    for (_, v) in dict where v != 0 {
        returnArr.append(v)
    }
    
    return returnArr == [1, 1]
}

func checkAddOrSub(_ a: String, _ b: String) -> Bool {
    if a.characters.count > b.characters.count {
        return Set(a.characters).subtracting(Set(b.characters)).count == 1
    }
    
    return Set(b.characters).subtracting(Set(a.characters)).count == 1
}

assert(oneAway("pale", "ple") == true, "1.5 failed")
assert(oneAway("pales", "pale") == true, "1.5 failed")
assert(oneAway("pale", "bale") == true, "1.5 failed")
assert(oneAway("pale", "bake") == false, "1.5 failed")

//: [Next](@next)
