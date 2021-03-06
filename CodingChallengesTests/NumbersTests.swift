//
//  NumbersTests.swift
//  CodingChallengesTests
//
//  Created by Jakub Gawecki on 02/04/2021.
//

import XCTest


class NumbersTests: XCTestCase {

    // that will not work. Swift does not allow you do operations on case as a check
//    func testFizzBuzz() {
//        for index in 0 ..< 100 {
//            switch index {
//            case index % 3 = 0:
//                print("Fizz")
//            case index % 5 = 0:
//                print("Buzz")
//            case index % 15 = 0:
//                print("Fizz Buzz")
//            default:
//                print(String(index))
//            }
//        }
//    }
    
    
    
    func testFizzBuzz() {
        for index in 0 ..< 100 {
            if index % 15 == 0 {
                print("Fizz Buzz")
            } else if index % 5 == 0 {
                print("Buzz")
            } else if index % 3 == 0 {
                print("Fizz")
            } else {
                print(index)
            }
        }
    }
    
    
    
    func testGeneratingRandomNumber() {
        // Arrange
        let maximum = 15
        let minimum = 2
        
        // Act
        if minimum <= 0 || maximum <= 0 {
            XCTFail("One of the number is not positive")
        } else if minimum <= 0 || maximum <= 0 || maximum < minimum {
            XCTFail("Maximum number is smaller than minimum number")
        }
        
        let randomNumber = Int.random(in: minimum ... maximum)
        
        print(randomNumber)
    }
    
    
    
    func testGeneratingRandomNumberUsingUInt32() {
        // Arrange
        let maximum = 15
        let minimum = 2
        
        // Act
        if minimum <= 0 || maximum <= 0 {
            XCTFail("One of the number is not positive")
        } else if minimum <= 0 || maximum <= 0 || maximum < minimum {
            XCTFail("Maximum number is smaller than minimum number")
        }
        // we add 1 cause it generates from 0 and does not inlude upper bound. Then we add minimum to add the difference.
        let randomNumber = Int(arc4random_uniform(UInt32(maximum - minimum + 1))) + minimum
    }
    
    
    
    func test4Power3ShouldGive64() {
        // Arrange
        let number          = 4
        let pow             = 3
        let shouldReturn    = 64
        
        var result = number
        
        
        // Act
        // we shall iterate only twice as the first time number is already 4 so
        // 1. 4 * 4 = 16
        // 2. 16 * 4 = 64
        // Done
        for _ in 1 ..< pow { result *= number }
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    
    // dont use temporary variable
    func testSwapTwoNumbers() {
        // Arrange
        var a = 3
        var b = 8
        
        
        // Act
        a = a + b // 11
        b = a - b // 11 - 8 = 3
        a = a - b
        
        
        // Assert
        XCTAssertEqual(a, 8)
        XCTAssertEqual(b, 3)
    }
    
    
    
    // Another approach
    func testSwapTwoNumberWithSwapFunction() {
        // Arrange
        var a = 3
        var b = 8
        
        
        // Act
        swap(&a, &b)
        
        
        // Assert
        XCTAssertEqual(a, 8)
        XCTAssertEqual(b, 3)
    }
    
    
    
    func testIs13PrimeShouldReturnTrue() {
        // Arrange
        let number = 16777259
        
        // Act
        if number <= 1 {
            XCTFail("Number is equal or smaller than 1, therefore cannot be a prime number")
        }
        
        
        // Assert
        for index in 2 ..< number {
            if number % index == 0 {
                XCTFail("Number is not prime as its divided by number \(index)")
            }
        }
        
    }
    
    
    
    func testBinaryHavingTwo1sHigherThan12ShouldBe17() {
        // Arrange
        let number          = 12
        var foundHigher     = false
        var higherNumber    = number + 1
        
        
        // Act
        let binaryNumberString      = String(number, radix: 2)
        let binaryNumberArrayString = Array(binaryNumberString)
        
        let onesCounter       = (binaryNumberArrayString.filter { $0 == "1" }).count
        
        while foundHigher == false {
            let binaryBiggerNumberString      = String(higherNumber, radix: 2)
            let binaryBiggerNumberArrayString = Array(binaryBiggerNumberString)
            
            if (binaryBiggerNumberArrayString.filter { $0 == "1" }).count == onesCounter {
                foundHigher.toggle()
                break
            }
            higherNumber += 1
        }
        
        
        // Assert
        XCTAssertEqual(higherNumber, 17)
    }
    
    
    
    func testBinaryHavingTwo1sLowerThan12ShouldBe10() {
        // Arrange
        let number          = 12
        var foundLower      = false
        var lowerNumber     = number - 1
        
        
        // Act
        let binaryNumberString      = String(number, radix: 2)
        let binaryNumberArrayString = Array(binaryNumberString)
        
        let onesCounter       = (binaryNumberArrayString.filter { $0 == "1" }).count
        
        
        while foundLower == false {
            let binarySmallerNumberString      = String(lowerNumber, radix: 2)
            let binarySmallerNumberArrayString = Array(binarySmallerNumberString)
            
            if (binarySmallerNumberArrayString.filter { $0 == "1" }).count == onesCounter {
                foundLower.toggle()
                break
            }
            lowerNumber -= 1
        }
        
        
        // Assert
        
        XCTAssertEqual(lowerNumber, 10)
    }
    
    
    
    func testBinaryReverseIn8Bit4ShouldReturn32() {
        // Arrange
        let number          = 4
        let shouldReturn    = 32
        
        // Act
        let binaryNumberAsString        = String(number, radix: 2)
        var binaryNumberAsArrayString   = Array(binaryNumberAsString)
        let binaryNumberLength          = binaryNumberAsArrayString.count
        
       
        if binaryNumberLength < 8 {
            for _ in 1 ... 8 - binaryNumberLength {
                binaryNumberAsArrayString.insert("0", at: 0)
            }
        }

        
        let binaryNumberString8Bit: String = String(binaryNumberAsArrayString)
        
        let binaryNumberString8BitReversed = binaryNumberString8Bit.reversed()
        
        let result = Int(String(binaryNumberString8BitReversed), radix: 2)
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    
    func testStringContainingOnlyNumbersShouldReturnTrue() {
        // Arrange
        let stringToCheck = "0101015454501023"
        
        
        // Act
        for element in stringToCheck {
            let number = Int(String(element))
            if number == nil {
                // Assert
                XCTFail("String is made not only out of numbers")
            }
        }
    }
    
    
    
    // Another approach
    // That approach will include Arabic numbers any other numbers
    func testStringContainingOnlyNumbersShouldReturnTrue2() {
        // Arrange
        let stringToCheck = "123312????????????"
        
        
        // Act
        // Inverted means that will look for all character not decimalDigits. Meaning not numbers.
        let nilIfJustDigits = stringToCheck.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted)
        
        
        // Assert
        XCTAssertNil(nilIfJustDigits)
    }
    
    
    
    func testSummarisingJustNumbersFromString1a2b3cShouldReturn6() {
        // Arrange
        let stringToCheck           = "1a2b3c"
        let shouldReturn            = 6
        
        var justNumbersArray: [Int] = []
        
        // Act
        let stringArray = Array(stringToCheck)
        for element in stringArray {
            if (element.wholeNumberValue != nil) {
                justNumbersArray.append(element.wholeNumberValue!)
            }
        }
        
        let result = justNumbersArray.reduce(0) { $0 + $1 }
        
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    ///do it later
    
//    func testCalculateSquareRootByHand() {
//        // we got 16
//        // its root square is 4
//        // its always going to be less than half of 16 (2 * 2 = 4 -> half is the lowest that can get)
//
//        // Arrange
//        let numberToCheck   = 16
//        let shouldReturn    = 4
//
//        let highestPossible = numberToCheck / 2
//        let lowestPossible = 1
//
//        let halfOfHalf = (highestPossible / 2)
//
//        // Act
//        if halfOfHalf * halfOfHalf == shouldReturn {
//            // early Assert
//            XCTAssertEqual(halfOfHalf * halfOfHalf, shouldReturn)
////        } else if {
//        }
////        while highestPossible > lowestPossible {
////        }
//    }
    
    func testSubstractWithoutSubstract5From9ShouldBe4() {
        // Arrange
        let number          = 9
        let substract       = 5
        let shouldReturn    = 4
        
        var result = 0
        
        
        // Act
        for x in substract ..< 9 {
            result += 1
        }
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    //Another approach
    func testSubstractWithoutSubstract5From9ShouldBe4Version2() {
        let number          = 9
        let substract       = 5
        let shouldReturn    = 4
        
        
        // Act
        // In bits format, if the left-most digit is 0, the rest represents negative number
        // if the most-left is 1, the rest represents positive number
        // by flipping 64 with ~ operator, you get -65 so you add 1
        let result = number + (~substract + 1)
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testShouldReturnMostCommonNumber() {
        // Arrange
        let numbersToCheck = [1,2,3,4,4,4,4,4,6,7,1]
        let shouldReturn = [4]
        var numberDictionary: [Int: Int] = [:]
        var result: [Int] = []
        
        // Act
        for number in numbersToCheck {
            if let count = numberDictionary[number] {
                numberDictionary[number] = count + 1
            } else {
                numberDictionary[number] = 1
                
            }
        }
        
        let highestValue = numberDictionary.values.max()
        
        for (number, _) in numberDictionary {
            if numberDictionary[number] == highestValue {
                result.append(number)
            }
        }
        
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
    }
    
    
    func testSumTheEvenRepeats() {
        // Arrange
        let arrayToCheck    = [1, 2, 2, 3, 3, 4]
        var dictionary      = [Int : Int]()
        var resultArray     = [Int]()
        var result          = 0
        let shouldReturn    = 5
        
        
        // Act
        for number in arrayToCheck {
            if let count = dictionary[number] {
                dictionary[number] = count + 1
            } else {
                dictionary[number] = 1
            }
        }
        
        print(dictionary)
        
        for (number, _) in dictionary {
            if dictionary[number]! % 2 == 0 {
                print("\(number) will be added")
                resultArray.append(number)
            }
        }
        
        result = resultArray.reduce(0, +)
        
        // Assert
        XCTAssertEqual(result, shouldReturn)
        
    }
    
    
//    func testCountTheLargestRange() {
//        // Arrange
//        let arrayToCheck = [10, 20, 30, -10, -20, 10, 20]
//        let shouldReturn = [0 ... 2]
//        var 
//        var higherRange  = Int()
//        
//        
//        // Act
//        for (index, number) in arrayToCheck.enumerated() {
//            if number > 0 {
//                longestCount    += 1
//                higherRange     = index
//            } else {
//                
//            }
//        }
//        
//    }
}
