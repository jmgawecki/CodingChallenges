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
                XCTFail("Not a pangram")
            }
        }
    }
}
