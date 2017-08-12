//
//  MandelbrotUITests.swift
//  MandelbrotUITests
//
//  Created by Ben Wheatley on 12/08/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

import XCTest

class MandelbrotUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
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
		self.measure() {
			let v = MandelbrotView()
			let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
			v.draw(rect)
		}
	}
	
}
