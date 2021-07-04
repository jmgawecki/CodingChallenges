//
//  Array+Ext.swift
//  CodingChallenges
//
//  Created by Jakub Gawecki on 11/04/2021.
//

import Foundation

extension Array where Element: Comparable {
    func sortWithBubble() -> [Element] {
        // Arrange
        var swapMade: Bool
        var highestSortedIndex = 1
        
        var returnValue = self
        
        // Act
        repeat {
            swapMade = false
            for index in 0 ..< self.count - highestSortedIndex {
                if returnValue[index] > returnValue[index + 1] {
                    swapMade = true
                    returnValue.swapAt(index, index + 1)
                }
            }
            highestSortedIndex += 1
        } while swapMade == true
        
        return returnValue
    }

}


extension Array where Iterator.Element == Int {
    
    func findTheSumFromArray(for sum: Int) -> [Int]? {
        let arrayToCheck    = self
        
        var lowerIndex      = 0
        var higherIndex     = arrayToCheck.count - 1
        
        
        while lowerIndex < higherIndex {
            if arrayToCheck[lowerIndex] + arrayToCheck[higherIndex] < sum {
                lowerIndex += 1
            }
            if arrayToCheck[lowerIndex] + arrayToCheck[higherIndex] > sum {
                higherIndex -= 1
            }
            if arrayToCheck[lowerIndex] + arrayToCheck[higherIndex] == sum {
                return [arrayToCheck[lowerIndex], arrayToCheck[higherIndex]]
            }
        }
        return nil
    }
}
