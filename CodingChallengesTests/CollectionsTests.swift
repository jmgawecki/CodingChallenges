//
//  CollectionsTests.swift
//  CodingChallengesTests
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import XCTest
@testable import CodingChallenges

class CollectionsTests: XCTestCase {

    // Collections to review in Collection+Ext.swift file, folder directory Extension
    
    func testCountNumberExtensionShouldReturnTrue() {
        // Arrange
        let array = [5, 15, 55, 515]
        let shouldReturn = 6
        
        
        // Act
        let result = array.countNumber(5)
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
        
    }
    
    
    func testSmallestElementsCounter3In4321ShouldReturn123() {
        // Arrange
        let collectionToCheck   = [4,3,2,1]
        let counter             = 3
        let shouldReturn        = [1,2,3]
        
        
        // Act
        let result = shouldReturn.smallestElements(counter: 3)
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testSortByLongestLength() {
        // Arrange
        let arrayToCheck = ["a", "abc", "ab"]
        let shouldReturn = ["abc", "ab", "a"]
        
        
        // Act
        let result = arrayToCheck.sortByLongestLength()
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
        
    }
    
    
    func testReturnMissingNumbers() {
        // Arrange
        var arrayToCheck = Array(1...100)
        arrayToCheck.remove(at: 25)
        arrayToCheck.remove(at: 20)
        arrayToCheck.remove(at: 6)
        let shouldReturn = [7, 21, 26]
        
        
        // Act
        let result = arrayToCheck.returnMissingNumbers()
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testFindMedianAverage() {
        // Arrange
        let collectionToCheck   = [1, 2, 3, 4]
        let shouldReturn        = 2.5
        
        // Act
        let result = collectionToCheck.findMedianAverage()
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testRecreatedFirstIndex() {
        // Arrange
        let collectionToCheck   = [1,2,3]
        let shouldReturn: Int?  = nil
        let index               = 5
        
        
        // Act
        let result = collectionToCheck.recreatedFirstIndex(of: index)
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    

    func testLinkedList() {
        // that creates a list of nodes
        var list = LinkedList<Character>()
        
        // that creates a single node. We call it a preciousNode and give it a Nil value for now
        var previousNode: LinkedListNode<Character>? = nil

        // we iterate through our String
        for letter in "abcdefghijklmnopqrstuvwxyz" {
            // we create an instance of a node with the value that is a letter from String
            let node = LinkedListNode(value: letter)

            // we check if previousNode has a value already. Its going to be nil for the first time. Every other time will have a value that we assign at the very end
            if let predecessor = previousNode {
                // All these are classes so its a reference type.
                // If the previous node exists (meaning, its not the first time that the function is runned)
                predecessor.next = node
            } else {
                list.start = node
            }

            previousNode = node
        }
        list.printNodes()

    }
    
    
    func testLinkedListMidPoint213ShouldReturn1() {
        // Arrange
        let list                                = LinkedList<Int>()
        let arrayToCheck: [Int]                 = [2,3,5,4,6,7]
        var previousNode: LinkedListNode<Int>?  = nil
        let shouldReturn: Int?                  = 4
        
        
        // Act
        for number in arrayToCheck {
            let node = LinkedListNode(value: number )
            
            if let precedessor = previousNode {
                precedessor.next = node
            } else {
                list.start = node
            }
            
            previousNode = node
        }
        list.printNodes()
        let result = list.returnMidNode()?.value
        

        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testRecreatedMap() {
        // Arrange
        let list = [1,2,3,4,5,6]
        let shouldReturn = ["1", "2", "3", "4", "5", "6"]
        
        
        // Act
        let result = list.recreatedMap { ourValue in
            String(ourValue)
        }
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    
}
