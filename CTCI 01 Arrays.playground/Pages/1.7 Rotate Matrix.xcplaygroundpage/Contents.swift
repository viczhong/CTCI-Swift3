//: [Previous](@previous)

import Foundation

//1.7
//Rotate Matrix: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?

func rotateMatrix<T: Equatable>(_ arr: [[T]]) -> [[T]] {
    var returnArr = arr
    
    for x in 0..<arr.count {
        for y in 0..<arr.count {
            returnArr[x][y] = arr[arr.count - 1 - y][x]
        }
    }
    
    return returnArr
}

rotateMatrix([[0, 1, 2],
              [3, 4, 5],
              [6, 7, 8]])

//: [Next](@next)
