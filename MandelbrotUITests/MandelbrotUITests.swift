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
    
    func testThatPinchAndPanWork() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
		let element = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
		element.swipeRight()
		element.swipeRight()
		element.swipeUp()
		element.swipeRight()
		element.swipeUp()
		element.swipeRight()
		element.swipeRight()
		element.swipeRight()
		element.swipeRight()
		element.swipeUp()
		element.swipeRight()
		element.swipeLeft()
		
		// I'm not sure what to actually test in this case.
		// I could compare pixel values to a recording, but I'm not sure that demonstrates anything is *correct*, only that it's what it was before.
	}
	
	func testPerformanceExample() {
		self.measure() {
			let v = MandelbrotView()
			let rect = CGRect(x: 0, y: 0, width: 300, height: 300)
			
			let renderer = UIGraphicsImageRenderer(size: rect.size)
			let _ = renderer.image { (context) in
				v.draw(rect)
			}
		}
	}
	
}
