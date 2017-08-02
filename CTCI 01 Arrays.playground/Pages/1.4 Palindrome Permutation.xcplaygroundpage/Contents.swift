//: [Previous](@previous)

import Foundation

//1.4
//Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
//EXAMPLE
//Input: Tact Coa
//Output: True (permutations: "taco cat". "atco cta". etc.)

func palindromePermutation(_ s: String) -> Bool {
    var dict = [Character : Int]()
    var counter = 0
    
    for c in s.lowercased().characters where c != " " {
        if dict[c] != nil {
            dict[c] = dict[c]! + 1
        } else {
            dict[c] = 1
        }
    }
    
    for v in dict.values where v % 2 != 0 {
        counter += 1
    }
    
    return counter <= 1
}

assert(palindromePermutation("Tact Coa") == true, "1.4 failed")
assert(palindromePermutation("Race Car") == true, "1.4 failed")
assert(palindromePermutation("AaBbCc") == true, "1.4 failed")
assert(palindromePermutation("AaBbCcD") == true, "1.4 failed")
assert(palindromePermutation("Rocky") == false, "1.4 failed")

//: [Next](@next)
