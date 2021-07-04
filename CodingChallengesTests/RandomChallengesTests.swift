//
//  RandomChallengesTests.swift
//  CodingChallengesTests
//
//  Created by Jakub Gawecki on 13/04/2021.
//

import XCTest
@testable import CodingChallenges

class RandomChallengesTests: XCTestCase {

    func testFindMostCommonElement() {
        // Arrange
        let stringToCheck   = "kubaismee"
        var dictionary      = [Character: Int]()
        
        
        // Act
        for char in stringToCheck {
            if (dictionary[char] != nil) {
                dictionary[char]! += 1
            } else {
                dictionary[char] = 1
            }
        }
        
        let highest = dictionary.values.max()
        
        
        let filteredDictionary = dictionary.filter { $0.value == highest }
        
        
        // Assert
        XCTAssertEqual(filteredDictionary, ["e": 2])
    }
    
    
    func testIfSumExists() {
        // Arrange
        let arrayToCheck    = [1,2,3,4,5,6,7,8,9,20]
        let numberToFind    = 24
        let numbersToFind   = [4,20]
        
        
        // Act
        let result = arrayToCheck.findTheSumFromArray(for: numberToFind)
        
        
        // Assert
        XCTAssertEqual(result, numbersToFind)
    }
}
