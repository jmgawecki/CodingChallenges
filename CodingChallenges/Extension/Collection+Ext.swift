//
//  Collection+Ext.swift
//  CodingChallenges
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit


extension Collection where Iterator.Element == Int {
    func countNumber(_ number: Int) -> Int {
        var counter = 0
        
        for item in self {
            let str = String(item)
            
            for letter in str {
                if String(letter) == String(number) {
                    counter += 1
                }
            }
        }
        
       return counter
    }
    
    
    func returnMissingNumbers() -> [Int] {
        let sortedArray     = self.sorted()
        var missingNumbers  = [Int]()
        
        for (index, number) in sortedArray.enumerated() {
            if index < sortedArray.count - 1 {
                if number + 1 != sortedArray[index + 1]  {
                    missingNumbers.append(number + 1)
                }
            }
            
        }
        return missingNumbers
    }
    
    
    func findMedianAverage() -> Double? {
        let sortedArray = self.sorted()
        let counter     = self.count
        
        if counter == 0 {
            return nil
        } else if counter % 2 == 0 {
            return (Double(sortedArray[(counter / 2) - 1] + sortedArray[(counter / 2)])) / 2
        } else {
            return Double(sortedArray[counter / 2])
        }
    }
    
    
    func recreatedFirstIndex(of numberToFind: Int) -> Int? {
        var result: Int? = nil
        
        guard numberToFind <= self.count else {
            return result
        }
        
        for (index, number) in self.enumerated() {
            if numberToFind == number {
                result = index
            }
        }
        return result
    }
}


extension Collection where Iterator.Element: Comparable {
    func smallestElements(counter: Int) -> [Iterator.Element] {
        
        let sortedCollection = self.sorted()
        
        return Array(sortedCollection.prefix(counter))
    }
    
    func recreatedMin() -> Iterator.Element? {
        guard var lowest = self.first else { return nil }
        
        for element in self {
            if element < lowest {
                lowest = element
            }
        }
        return lowest
    }
    
    
    func recreateMinSecondApproach() -> Iterator.Element? {
        // creates an iterator (all collections are backed by iterator
        // make iterator creates an iterator that allows us to go through the collection
        var it = makeIterator()
        
        // when called next for the first time, it gives us first element of the collection
        guard var lowest = it.next() else { return nil }
        
        while let item = it.next() {
            if lowest > item {
                lowest = item
            }
        }
        
        return lowest
    }
    
    // Shortest solution. Not the most efficient one as it needs to shuffle all places first
    func recreateMinThirdApproach() -> Iterator.Element? {
        return self.sorted().first
    }
    
    
    
}


extension Collection where Iterator.Element == String {
    func sortByLongestLength() -> [String] {
        var stringToReturn: [String] = []
        
        stringToReturn = self.sorted { first, second in
            first > second
        }
        
        return stringToReturn
    }
}


extension Collection {
    // Add a generic method that accepts a closure operating on our element type and returns a new type, with the whole metho retirning an array of that type
    func recreatedMap<T>(_ transform: (Iterator.Element) throws -> T) rethrows -> [T] {
        var returnValue = [T]()
        
        for item in self {
            returnValue.append(try transform(item))
        }
        
        // send back the return value
        return returnValue
    }
    
    
   
}
