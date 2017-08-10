//
//  MandelbrotView.swift
//  Mandelbrot
//
//  Created by Ben Wheatley on 10/08/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

import UIKit

@IBDesignable
class MandelbrotView: UIView {

	@IBInspectable var scale: CGFloat = 1 { didSet { setNeedsDisplay() } }
	
    override func draw(_ rect: CGRect) {
        // Drawing code
		
		let rez = 100.0
		
		for real in stride(from: Double(-2), to: Double(2), by: 1.0/rez) {
			for imag in stride(from: Double(-2), to: Double(2), by: 1.0/rez) {
				
				let (x, y) = ( (real+2)*rez, (imag+2)*rez )
				var difficulty: Int = 0
				let c = Complex(r: real, i: imag)
				var z = Complex(r: 0, i: 0)
				let MAX_DIFFICULTY = 256
				while difficulty<MAX_DIFFICULTY && z.abs()<2 {
					z = z*z + c
					difficulty = difficulty+1
				}
				
				let path = UIBezierPath(rect: CGRect(x: Int(x), y: Int(y), width: Int(rez), height: Int(rez)))
				UIColor(white: CGFloat(difficulty)/CGFloat(MAX_DIFFICULTY), alpha: 1).setFill()
				UIColor.blue.setStroke()
				path.fill()
			}
		}
		
		
    }

}
