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
	@IBInspectable var offset_x: CGFloat = 0 { didSet { setNeedsDisplay() } }
	@IBInspectable var offset_y: CGFloat = 0 { didSet { setNeedsDisplay() } }
	
	static let CLUT: [UInt32] = { () -> [UInt32] in
		var CLUT: [UInt32] = []
		for i in 0..<0xFF {
			CLUT.append(UInt32(i))
		}
		for i in 0..<0xFF {
			CLUT.append(UInt32(i<<8 | 0xFF))
		}
		for i in 0..<0xFF {
			CLUT.append(UInt32(i<<16 | (0xFFFF)))
		}
		for i in 0..<0xFF {
			CLUT.append(UInt32(0xFF-i | (0xFFFF00)))
		}
		for i in 0..<0xFF {
			CLUT.append(UInt32((0xFF-i)<<8 | (0xFF0000)))
		}
		return CLUT
	}()
	
    override func draw(_ rect: CGRect) {
        // Drawing code
		
		let dataPointer = UnsafeMutablePointer<UInt32>.allocate(capacity: Int(rect.height)*Int(rect.width))
		var pixel = 0
		
		let (halfWidth, halfHeight) = (rect.width/2, rect.height/2)
		
		// This mess is to prevent fatal error on overflow
		// ("Double value cannot be converted to UInt32 because the result would be greater than UInt32.max")
		let floatMaxDifficulty = 16 + scale/100.0
		let MAX_DIFFICULTY: UInt32 = UInt32(min(Double(UInt32.max), floatMaxDifficulty))
		
		for y in 0..<Int(rect.height) {
			for x in 0..<Int(rect.width) {
		
				let (real, imag) = (Double(CGFloat(x)-halfWidth-offset_x)/scale, Double(CGFloat(y)-halfHeight+offset_y)/scale)
				var difficulty: UInt32 = 0
				let c = Complex(r: real, i: imag)
				var z = Complex(r: 0, i: 0)
				while z.absSquared()<=4 {
					z = z*z + c
					difficulty += 1
					if (difficulty>=MAX_DIFFICULTY) {
						difficulty = 0
						break
					}
				}
				
				difficulty %= 0xF
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
	
	@objc public func changeScale(recognizer: UIPinchGestureRecognizer) {
		switch recognizer.state {
		case .changed, .ended:
			scale *= Double(recognizer.scale)
			offset_x *= recognizer.scale
			offset_y *= recognizer.scale
			recognizer.scale = 1
		default: break
		}
	}
	
	@objc public func changePosition(recognizer: UIPanGestureRecognizer) {
		switch recognizer.state {
		case .changed, .ended:
			offset_x += recognizer.translation(in: self).x
			offset_y += recognizer.translation(in: self).y
			recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self)
		default: break
		}
	}

}
