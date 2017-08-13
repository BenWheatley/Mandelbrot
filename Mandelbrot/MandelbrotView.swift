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
		
		let dataPointer = UnsafeMutablePointer<UInt32>.allocate(capacity: Int(rect.height)*Int(rect.width))
		var pixel = 0
		
		for y in 0..<Int(rect.height) {
			for x in 0..<Int(rect.width) {
				
				let (real, imag) = (-2 + Double(x)/scale, -2 + Double(y)/scale)
				var difficulty: UInt32 = 0
				let c = Complex(r: real, i: imag)
				var z = Complex(r: 0, i: 0)
				let MAX_DIFFICULTY: UInt32 = 16
				while difficulty<MAX_DIFFICULTY && z.absSquared()<=4 {
					z = z*z + c
					difficulty = difficulty+1
				}
				
				difficulty <<= 4
				
				dataPointer[pixel] = difficulty | difficulty<<8 | difficulty<<16 | 0xFF000000
				pixel += 1
			}
		}
		
		if let contextRef = CGContext.init(data: dataPointer,
										width: Int(rect.width),
										height: Int(rect.height),
										bitsPerComponent: 8,
										bytesPerRow: Int(rect.width)*4,
										space: CGColorSpace(name: CGColorSpace.genericRGBLinear)!,
										bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) {
			if let bitMapImage = contextRef.makeImage() {
				UIGraphicsGetCurrentContext()?.draw(bitMapImage, in: self.bounds)
			}
		}
    }

}
