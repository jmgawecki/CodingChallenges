//
//  FilesTests.swift
//  CodingChallengesTests
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import XCTest

class FilesTests: XCTestCase {

    func testPrintLastLinesTestsFileIsNotNil() {
        // Arrange
        let fileName = "PrintLastLinesTests"
        var contents = ""
        
        
        // Act
        let filepath = Bundle.main.path(forResource: fileName, ofType: "rtf")
        do {
            contents = try String(contentsOfFile: filepath!)
        } catch {
            // Assert
            XCTFail("File not found")
        }
    }
    
    
    func testPrintLastLinesFromFile() {
        // Arrange
        let fileName                = "PrintLastLinesTests"
        var fileContent             = ""
        let numberOfLinesToReturn   = 3
        let shouldReturn            = "Marcin}, Kiarek\\, Marta\\"
        var arrayForResults         = [String]()
        
        
        // Act
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "rtf") {
            do {
                fileContent = try String(contentsOfFile: filepath)
            } catch {
                XCTFail()
            }
        }
        
        let linesArray = fileContent.components(separatedBy: "\n")
        
        // Precise type [String]. Otherwise it will come back as ReversedCollectionof<String> and you will not be able to iterate through
        let linesReversed: [String] = linesArray.reversed()
        
        guard linesReversed.count > 0 else { return }
        
        // min(x,y) compares two numbers and return smaller. We do it so we wont go through loop more times than we have elements
        for i in 0 ..< min(linesReversed.count, numberOfLinesToReturn) {
            arrayForResults.append(linesReversed[i])
            print(min(linesReversed.count, numberOfLinesToReturn))
        }
        
        let finalResult = arrayForResults.joined(separator: ", ")
        
        
        // Assert
        XCTAssertEqual(finalResult, shouldReturn)
        
    }
    
    
    func testLogAMessage() {
        // Arrange
        let logMessage = "Hello"
        let logFile = "/Users/jakubgawecki/desktop/myFile.txt"
        
        
        // Act
        /// First we do need to check if the logFile exists, if it does not, we will provide it a default value
        var existingLog = (try? String(contentsOfFile: logFile)) ?? ""
        /// After the line above, existinLog will be a full log file or an empty String
        
        /// Now we are adding a new message with the date
        existingLog.append("\(Date()): \(logMessage)\n")
        
        /// Writing data to disk is a throwing function, so we need to handle errors too.
        do {
            try existingLog.write(toFile: logFile, atomically: true, encoding: .utf8)
        } catch {
//            XCTFail("Failed to write to log: \(error.localizedDescription)")
        }
    }
    
    
    func testCreateDocumentsDirectory() {
        // Arrange
        
        
        // Act
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths[0])
    }

}
