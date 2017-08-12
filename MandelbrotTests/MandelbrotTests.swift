//
//  MandelbrotTests.swift
//  MandelbrotTests
//
//  Created by Ben Wheatley on 12/08/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

import XCTest

class MandelbrotTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
	}
	
	func testComplexNumbers() {
		let realNum: Double = 3
		let complexNum = Complex(r: realNum, i: 0)
		XCTAssertEqual(realNum, complexNum.abs())
		XCTAssert(complexNum.i == 0)
		XCTAssertEqual(realNum+realNum, (complexNum+complexNum).abs())
		XCTAssertEqual(realNum-realNum, (complexNum-complexNum).abs())
		XCTAssertEqual(realNum*realNum, (complexNum*complexNum).abs())
		XCTAssertEqual(realNum/realNum, (complexNum/complexNum).abs())
		
		var realNum2 = realNum
		var complexNum2 = complexNum
		realNum2 += realNum2
		complexNum2 += complexNum2
		XCTAssertEqual(realNum, complexNum.abs())
		XCTAssert(complexNum.i == 0)
		XCTAssert(realNum2 == complexNum.abs())
		
		realNum2 *= realNum2
		complexNum2 *= complexNum2
		
		XCTAssertEqual(realNum, complexNum.abs())
		XCTAssert(complexNum.i == 0)
		XCTAssert(realNum2 == complexNum.abs())
		
		realNum2 /= realNum2
		complexNum2 /= complexNum2
		
		XCTAssertEqual(realNum, complexNum.abs())
		XCTAssert(complexNum.i == 0)
		XCTAssert(realNum2 == complexNum.abs())
		XCTAssertNotEqual(3, Complex(r: 0, i: 3).r)
		
		let complexNum3 = Complex(r: 0, i: 3)
		let complexNum4 = Complex(r: 0, i: 1)
		XCTAssertNotEqual(complexNum3, complexNum4)
		XCTAssertEqual(complexNum3*complexNum4, Complex(r: -3, i: 0))
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
