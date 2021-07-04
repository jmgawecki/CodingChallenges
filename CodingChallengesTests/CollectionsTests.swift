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
    
    
    
    func testSortWithBubble() {
        // Arrange
        let list = [4,3,3,3,5,6,7,8,9,3,1,2,1,1,1]
        let shouldReturn = [1,1,1,1,2,3,3,3,3,4,5,6,7,8,9]
        
        
        
        // Act
        let result = list.sortWithBubble()
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testSortWithInsertion() {
        // Arrange
        let list = [4,3,3,3,5,6,7,8,9,3,1,2,1,1,1]
        _ = [1,1,1,1,2,3,3,3,3,4,5,6,7,8,9]
        var returnValue = [Int]()
        
        
        // Act
        for unsorted in list {
            print(returnValue)
            // when its empty. first try
            if returnValue.count == 0 {
                returnValue.append(unsorted)
            } else {
                var placed = false
                
                for (index, sorted) in returnValue.enumerated() {
                    if unsorted < sorted {
                        returnValue.insert(unsorted, at: index)
                
                        placed = true
                        break
                    }
                }
                
                if !placed {
                    returnValue.append(unsorted)
                }
            }
        }
    }
    
    
    func testIsomorphicValues() {
        // Arrange
        let first           = "carry"
        let second          = "baddy"
        var dictionary      = [Character: Character]()
        var isIsomorphic    = true
        
        
        let firstStringed   = String(describing: first)
        let secondStringed  = String(describing: second)
        
        let firstAsArray    = Array(firstStringed)
        let secondAsArray   = Array(secondStringed)
        
        
        // Act
        // when we swap letters one by one.
        // Solution is okay when perhaps 2 same letter will be replaced by two other same letters
        // Solution is okay when same letter is replaced by the same letter
        if firstAsArray.count == secondAsArray.count {
            for (index, char) in firstAsArray.enumerated() {
                // loop over each character
                let otherCharacter = secondAsArray[index]
                
                // Check if there is a Key that we are looking for to compare
                // If there is, we assign its value to currentMapping
                if let currentMapping = dictionary[char] {
                    // Now we know there is a key.
                    // We need to compare if a value for that key is the same as otherCharacter
                    if currentMapping != otherCharacter {
                        // if its not then it means that same letter from a first string, would have two different signs after swapping and that makes is not isomorphic
                        isIsomorphic = false
                    }
                } else {
                    // now we know that there is no dictionary element with the letter from first array as a key
                    // but there still can be a value from the other array.
                    if dictionary.values.contains(otherCharacter) {
                        // if there is, it means that is assigned to another key, which makes that string not isomorphic
                        isIsomorphic = false
                    }
                    
                    dictionary[char] = otherCharacter
                }
            }
        }
        XCTAssertTrue(isIsomorphic)
    }
    
    
//    func testBalancedBrackets() {
//        // Arrange
//        let input               = "[()<()>]"
//        let validBrackets       = "([{<>}])"
//        let validCharacterSet   = CharacterSet(charactersIn: validBrackets).inverted
//        var openingStack        = [Character]()
//        var closingStack        = [Character]()
//
//        // Act
//        // Check if correct type of characters
//        guard input.rangeOfCharacter(from: validCharacterSet) == nil else {
//            return
//
//        }
//
//        // Check if even number of characters
//        guard input.count % 2 == 0 else {
//            return
//        }
//
//
//        _ = ["(":")", "[":"]", "{":"}", "<":">"]
//
//        for bracket in input {
//            if bracket == "(" || bracket == "[" || bracket == "<" || bracket == "{" {
//                openingStack.append(bracket)
//            } else {
//                closingStack.append(bracket)
//            }
//        }
//
//        print(openingStack)
//        print(closingStack)
//    }
    
    
    
}
