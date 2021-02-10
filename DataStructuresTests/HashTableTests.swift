//
//  HashTableTests.swift
//  DataStructuresTests
//
//  Created by Vladimir Gogunsky on 2/10/21.
//

import XCTest
@testable import DataStructures

class HashTableTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInsertion() {
        var hashTable = HashTable<String, String>()
        self.measure {
            hashTable["1"] = "First"
            hashTable["2"] = "Second"
            
            XCTAssertEqual(hashTable["1"], "First")
            XCTAssertEqual(hashTable["2"], "Second")

            hashTable["2"] = nil
            
            XCTAssertEqual(hashTable["2"], nil)
        }
    }

}
