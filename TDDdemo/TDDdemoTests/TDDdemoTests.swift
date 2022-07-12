//
//  TDDdemoTests.swift
//  TDDdemoTests
//
//  Created by zip520123 on 12/07/2022.
//

import XCTest
@testable import TDDdemo

//O(n), O(1)
func foo(_ x: Int) -> Int {
    if x == 0 || x == 1 {return x}
    var a = 0, b = 1
    for _ in 0..<x {
        let temp = a+b
        a = b
        b = temp
    }
    return a
}

class TDDdemoTests: XCTestCase {

    func test_fab() {
        
        XCTAssertEqual(foo(0), 0)
        XCTAssertEqual(foo(1), 1)
        XCTAssertEqual(foo(2), 1)
        
        XCTAssertEqual(foo(3), 2)

        XCTAssertEqual(foo(4), 3)
        XCTAssertEqual(foo(5), 5)
        XCTAssertEqual(foo(6), 8)
    }
    
}
