//
//  StringsTests.swift
//  CodingChallengesTests
//
//  Created by Jakub Gawecki on 02/04/2021.
//

import XCTest

class StringsTests: XCTestCase {

    func testFindPangramShouldPass() {
        // Arrange
        let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        let pangramShouldPass = "The quick brown fox jumps over the lazy dog"
        let notPangramShouldFail = "abc"
        
        // Act
        for char in alphabet {
            if pangramShouldPass.lowercased().contains(char) { } else {
                // Assert
                XCTFail("Not a pangram")
            }
        }
    }
    
    // another approach
    func testFindPangramShouldPass2() {
        // Arrange
        let pangramShouldPass = "The quick brown fox jumps over the lazy dog"
        
        
        // Act
        let set = Set(pangramShouldPass.lowercased())
        let letters = set.filter { $0 >= "a" && $0 <= "z" }
        
        
        // Assert
        XCTAssertEqual(letters.count, 26)
    }
    
    
    func testStringShouldReturnTuple6And15() {
        // Arrange
        let string          = "Swift Coding Challenges"
        let vowels          = "aeiou"
        let consonants      = "bcdfghjklmnpqrstvwxyz"
        var vowelCount      = 0
        var consonantCount  = 0
        var tuple: (vowels: Int, consonants: Int)
        
        // Act
        for letter in string.lowercased() {
            if vowels.contains(letter) {
                vowelCount += 1
            } else if consonants.contains(letter) {
                consonantCount += 1
            }
        }
        
        tuple = (vowels: vowelCount, consonants: consonantCount)
        
        // Assert
        if tuple != (6,15) {
            XCTFail("Not identical")
        }
    }
    
    
    func testTwoStringWith3DifferentLettersAndSameLengthShouldPass() {
        // Arrange
        let firstString     = "Same length string"
        let secondString    = "Same length strogo"
        
        let firstStringCleared  = firstString.replacingOccurrences(of: " ", with: "").lowercased()
        let secondStringCleared = secondString.replacingOccurrences(of: " ", with: "").lowercased()
        
        var differences = 0
        
        // Act
        if firstStringCleared.count != secondStringCleared.count { XCTFail(" String are of not the same length ") }
        
        let firstStringArray    = Array(firstStringCleared)
        let secondStringArray   = Array(secondStringCleared)
        
        for (index, letter) in firstStringArray.enumerated() {
            if letter != secondStringArray[index] {
                differences += 1
                if differences > 3 { XCTFail("More than 3 differences in our strings")}
            }
        }
    }
    
    
    func testFindingLongestPrefixShouldReturnSWI() {
        // Arrange
        let string          = "swift switch swill swim"
        let wordsArray      = string.components(separatedBy: " ")
        var currentPrefix   = ""
        
        
        // Act
        guard let first = wordsArray.first else {
            XCTFail("String is empty")
            return
        }
        
        outerLoop: for letter in first {
            // we add one letter at the time to the current prefix
            currentPrefix.append(letter)
            // we iterate through array of Words (wordsArray)
            for word in wordsArray {
                // if any of words do not match current prefix...
                if !word.hasPrefix(currentPrefix) {
                    // ... We remove the last added letter and break outerLoop
                    currentPrefix.removeLast()
                   break outerLoop
                }
            }
        }
        
        
        // Assert
        XCTAssertEqual(currentPrefix, "swi")
    }
    
    
    func testRunLengthEncodingShouldReturnTrue() {
        // Arrange
        let stringToTest    = "aabbcc"
        var finalString     = ""
        let shouldReturn    = "a2b2c2"
        
        guard var currentLetter = stringToTest.first else {
            XCTFail("Empty string")
            return
        }
        
        currentLetter               = stringToTest.first!
        var currentLetterCounter    = 0
        
        
        // Act
        for (index, letter) in stringToTest.enumerated() {
            if currentLetter == letter {
                currentLetterCounter += 1
                if stringToTest.count == index + 1 {
                    finalString.append("\(currentLetter)\(currentLetterCounter)")
                    break
                }
            } else if currentLetter != letter {
                finalString.append("\(currentLetter)\(currentLetterCounter)")
                currentLetterCounter = 1
                currentLetter = letter
            }
        }
        
        
        // Assert
        XCTAssertEqual(finalString, shouldReturn)
    }
    
/// Finish challenge number 14 later
//    func testStringPermutations() {
//        // Arrange
//        let stringToCheck       = "abc"
//        let stringLength        = stringToCheck.count
//        let possibleVariation   = ["abc", "acb", "bac", "bca", "cab", "cba"]
//        let lettersArray        = Array(stringToCheck)
//
//
//        // Act
//
//        if stringLength == 0 {
//            XCTFail("String is empty")
//        }
//
//        for i in 0 ..< stringLength {
//            let left = String(lettersArray[0 ..< i])
//        }
//    }
    
    
    func testReverseWordsInStringShouldReturnTrue() {
        // Arrange
        let stringToCheck   = "Swift Coding Challenges"
        let shouldReturn    = "tfiwS gnidoC segnellahC"
        let stringArray     = stringToCheck.components(separatedBy: " ")
        
        
        // Act
        // using String() wrapper is important as it changes reversedStringArray's type from [ReversedCollection<String>] to [String]
        var reversedStringArray = stringArray.map { String($0.reversed()) }
        let result = reversedStringArray.joined(separator: " ")
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
//    func testRemoveOccurencies() {
//        let string = "aabbccccccccddadd"
////        let shouldReturn = "aabbccdda"
//
//        let stringArray = Array(string)
//        var currentChar = stringArray[0]
//        var counter     = 1
//        let limit       = 2
//        var stringToReturn = [Character]()
//        // we need to check how many times a occurs when perhaps limit is 2 in a row
//
//        for index in 0 ..< stringArray.count - 1 {
//            // if next char is the same, counter ++
//            print("is currentChar: \(currentChar) == nextChar: \(stringArray[index + 1])")
//            if currentChar == stringArray[index + 1] {
//                print("it is")
//                print("is counter of that char smaller than 3? counter: \(counter)")
//                if counter < 3 {
//                    print("it is")
//                    print("so we append \(currentChar) to our return array")
//                    stringToReturn.append(currentChar)
//                    counter += 1
//                    print("we increase counter to: \(counter)")
//                } else {
//                    print("counter its 3: \(counter)")
//                    print("lets ")
//                    currentChar = stringArray[index + 1]
////                    stringToReturn.append(currentChar)
//                    counter = 1
//                }
//            } else {
//                stringToReturn.append(currentChar)
//                currentChar = stringArray[index + 1]
//                counter = 1
//            }
//        }
//
//        print(stringToReturn)
//
//    }
    
    
    func testRemoveOccurencies() {
        let string          = "aabbccccccccccddadd"
        var stringArray     = Array(string)
        stringArray.append(" ")
        var counter         = 1
        let limit           = 2
        var stringToReturn  = ""
        
        for index in 0 ..< stringArray.count - 1 {
            // if current element of the array is exactly the same as next one
            if stringArray[index] == stringArray[index + 1] {
                // if current and next are same ones, we check how many did we count already
                if counter < limit {
                    counter += 1
                }
            } else {
                // next one its not the same, so now we append
                for _ in 0 ..< counter {
                    stringToReturn.append(stringArray[index])
                }
                counter = 1
            }
        }
        
        
        print(stringToReturn)
    }
    
    
    func testVowelsAndConsonants() {
        // Arrange
        let stringToCheck   = "jakubgawecki"
        var vowels          = ""
        var consonants      = ""
        
        
        // Act
        for char in stringToCheck {
            if char == "a" || char == "e" || char == "u" || char == "i" || char == "o" || char == "A" || char == "E" || char == "U" || char == "I" || char == "O" {
                vowels.append(char)
            } else {
                consonants.append(char)
            }
        }
        
        let shouldReturn = (vowels: vowels, consonants: consonants)
        
        print(shouldReturn)
    }
    
    
    func testVowelsAndConsonantsBetterSolution() {
        // Arrange
        let stringToCheck   = "jakubGawecki"
        let vowels          = "AEIOUaeiou"
        let consonants      = "BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz"
        
        
        // Act
        let filteredVowels = stringToCheck.filter { vowels.contains($0) }
        let filteredConsonants = stringToCheck.filter { consonants.contains($0) }
        let tuple = (vowels: filteredVowels, consonants: filteredConsonants)
        
        print(tuple)
       
        
    }
}

