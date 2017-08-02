//: [Previous](@previous)

import Foundation

//1.8
//Zero Matrix: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.

func zeroMatrix(_ arr: [[Int]]) -> [[Int]] {
    var array = arr
    
    var rowChange = Set<Int>()
    var colChange = Set<Int>()
    
    
    for x in 0..<arr.count {
        for y in 0..<arr[x].count {
            if arr[x][y] == 0 {
                rowChange.insert(x)
                colChange.insert(y)
            }
        }
    }
    
    for x in 0..<array.count {
        for y in 0..<array[x].count {
            if rowChange.contains(x) || colChange.contains(y) {
                array[x][y] = 0
            }
        }
    }
    
    return array
}

zeroMatrix([[1, 2, 2, 3, 5],
            [1, 2, 0, 4, 0],
            [0, 4, 0, 1, 2],
            [1, 2, 4, 2, 5]])

//: [Next](@next)
