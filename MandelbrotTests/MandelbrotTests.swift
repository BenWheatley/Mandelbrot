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
		XCTAssertEqual(complexNum.i, 0)
		XCTAssertEqual(realNum+realNum, (complexNum+complexNum).abs())
		XCTAssertEqual(realNum-realNum, (complexNum-complexNum).abs())
		XCTAssertEqual(realNum*realNum, (complexNum*complexNum).abs())
		XCTAssertEqual(realNum/realNum, (complexNum/complexNum).abs())
		XCTAssertEqual(complexNum/Complex(r: 3, i: 0), Complex(r: 1, i: 0))
		XCTAssertEqual(pow(complexNum.abs(), 2), complexNum.absSquared())
		
		var realNum2 = realNum
		var complexNum2 = complexNum
		realNum2 += realNum2
		complexNum2 += complexNum2
		XCTAssertEqual(realNum, complexNum.abs())
		XCTAssertEqual(complexNum.i, 0)
		XCTAssertEqual(realNum2, complexNum2.abs())
		
		realNum2 *= realNum2
		complexNum2 *= complexNum2
		
		XCTAssertEqual(realNum2, complexNum2.abs())
		
		realNum2 /= realNum2
		complexNum2 /= complexNum2
		
		XCTAssertEqual(realNum2, complexNum2.abs())
		XCTAssertNotEqual(3, Complex(r: 0, i: 3).r)
		
		complexNum2 = complexNum2 / Complex(r: 0, i: 0)
		XCTAssert(complexNum2.r.isNaN)
		XCTAssert(complexNum2.i.isNaN)
		
		let complexNum3 = Complex(r: 0, i: 3)
		XCTAssertNotEqual(complexNum3, .𝒊)
		XCTAssertEqual(complexNum3 * .𝒊, Complex(r: -3, i: 0))
		XCTAssertEqual(.𝒊 * .𝒊, Complex(r: -1, i: 0))
		
		var complexNum4 = Complex(r: 6, i: 7)
		complexNum4 -= Complex(r: 12, i: 6)
		XCTAssertEqual(complexNum4, Complex(r: -6, i: 1))
		
		let (r, i) = (4.0, 5.0)
		XCTAssertEqual(Complex(r: r, i: i).conj(), Complex(r: r, i: -i))
		
		XCTAssertEqual(Complex(r: 1, i: 0).arg(), 0)
		XCTAssertEqual(Complex(r: -1, i: 0).arg(), .pi)
		XCTAssertEqual(Complex(r: 0, i: 1).arg(), .pi/2)
		XCTAssertEqual(Complex(r: 0, i: -1).arg(), -.pi/2)
		XCTAssertEqual(Complex(r: -1, i: -1).arg(), -.pi*3.0/4.0)
		XCTAssert(Complex(r: 0, i: 0).arg().isNaN)
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
