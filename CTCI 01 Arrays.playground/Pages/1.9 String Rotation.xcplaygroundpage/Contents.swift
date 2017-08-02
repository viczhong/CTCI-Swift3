//: [Previous](@previous)

import Foundation

//1.9
//String Rotation: Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring (e.g.,"waterbottle" is a rotation of "erbottlewat").

func stringRotation(_ s1: String, s2: String) -> Bool {
    let wrappedString = s1 + s1
    
    return wrappedString.range(of: s2) != nil
}

assert(stringRotation("waterbottle", s2: "erbottlewat") == true, "1.9 failed")
assert(stringRotation("waterbottle", s2: "erbottlewatt") == false, "1.9 failed")

//: [Next](@next)
