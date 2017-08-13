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

	@IBInspectable var scale: Double = 100 { didSet { setNeedsDisplay() } }
	
    override func draw(_ rect: CGRect) {
        // Drawing code
		
		for y in 0..<Int(rect.height) {
			for x in 0..<Int(rect.width) {
				
//				let (real, imag) = (-2 + Double(x)/scale, -2 + Double(y)/scale)
//				var difficulty: Int = 0
//				let c = Complex(r: real, i: imag)
//				var z = Complex(r: 0, i: 0)
//				let MAX_DIFFICULTY = 16
//				while difficulty<MAX_DIFFICULTY && z.absSquared()<=4 {
//					z = z*z + c
//					difficulty = difficulty+1
//				}
				
				let MAX_DIFFICULTY = 16
				var difficulty: Int = 0
				
				var (c_r, c_i) = (-2 + Double(x)/scale, -2 + Double(y)/scale)
				
				var (z_r, z_i) = (0.0, 0.0)
				var zrsqr = 0.0//z_r * z_r
				var zisqr = 0.0//z_i * z_i
				while (difficulty<MAX_DIFFICULTY) && (zrsqr + zisqr <= 4.0)
				{
					z_i = z_r * z_i
					z_i += z_i // Multiply by two
					z_i += c_i
					z_r = zrsqr - zisqr + c_r
					zrsqr = z_r * z_r
					zisqr = z_i * z_i
					difficulty = difficulty+1
				}
				
				let path = UIBezierPath(rect: CGRect(x: Int(x), y: Int(y), width: Int(scale), height: Int(scale)))
				UIColor(white: CGFloat(difficulty)/CGFloat(MAX_DIFFICULTY), alpha: 1).setFill()
				UIColor.blue.setStroke()
				path.fill()
			}
		}
		
		
    }

}
