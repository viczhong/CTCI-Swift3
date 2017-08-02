//: [Previous](@previous)

import Foundation

//1.6
//String Compression: Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2b1c5a3. If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a - z).

func stringCompression(_ s: String) -> String {
    let str = Array(s.characters)
    var newString = ""
    var counter = 1
    
    for x in 0..<str.count - 1 {
        
        if str[x] == str[x + 1] {
            counter += 1
        } else {
            newString += "\(str[x])\(counter)"
            counter = 1
        }
    }
    
    if str[str.count - 1] != str[str.count - 2] {
        newString += "\(str[str.count - 1])1"
    } else {
        newString += "\(str[str.count - 1])\(counter)"
    }
    
    if newString.characters.count < str.count {
        return newString
    } else {
        return s
    }
}

assert(stringCompression("aabcccccaaa") == "a2b1c5a3", "1.6 failed")
assert(stringCompression("aabcccccaaab") == "a2b1c5a3b1", "1.6 failed")
assert(stringCompression("abcd") == "abcd", "1.6 failed")

//: [Next](@next)
