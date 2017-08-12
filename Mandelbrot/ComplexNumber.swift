//
//  ComplexNumber.swift
//  Mandelbrot
//
//  Created by Ben Wheatley on 10/08/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

import Foundation

/**
Implements complex numbers. Only written as practice for automatic testing and swift
(more fun than random lecture notes), find a better implementation of Complex numbers
if you really want them — this is reinventing the wheel!

Uses Double internaly, not generic, as using generics prevents:
1) 'static let' from working
2) calculating argument of polar form calls atan(Double) etc, which are not themselves generic
(Float would require atanf(Float) etc.)
*/
struct Complex: Equatable {
	
	static let 𝒊 = Complex(r: 0, i: 1)
	
	var r: Double
	var i: Double
	
	static public func +(lhs: Complex, rhs: Complex) -> Complex {
		return Complex(r: lhs.r + rhs.r,
		               i: lhs.i + rhs.i)
	}
	
	static public func -(lhs: Complex, rhs: Complex) -> Complex {
		return Complex(r: lhs.r - rhs.r,
		               i: lhs.i - rhs.i)
	}
	
	static public func *(lhs: Complex, rhs: Complex) -> Complex {
		return Complex(r: (lhs.r*rhs.r)-(lhs.i*rhs.i),
		               i: (lhs.i*rhs.r)+(lhs.r*rhs.i))
	}
	
	static public func /(lhs: Complex, rhs: Complex) -> Complex {
		if rhs.r==0 && rhs.i==0 {
			return Complex(r: .nan, i: .nan)
		}
		let (a, b, c, d) = (lhs.r, lhs.i, rhs.r, rhs.i)
		let c2_d2 = c*c + d*d
		return Complex(r: ((a*c)+(b*d))/c2_d2,
		               i: ((b*c)-(a*d))/c2_d2)
	}
	
	static public func +=(lhs: inout Complex, rhs: Complex) {
		lhs = lhs + rhs
	}
	
	static public func -=(lhs: inout Complex, rhs: Complex) {
		lhs = lhs - rhs
	}
	
	static public func *=(lhs: inout Complex, rhs: Complex) {
		lhs = lhs * rhs
	}
	
	static public func /=(lhs: inout Complex, rhs: Complex) {
		lhs = lhs / rhs
	}
	
	// Special complex functions
	
	public func conj() -> Complex {
		return Complex(r: r, i: -i)
	}
	
	// Polar coordinates
	
	public func abs() -> Double {
		return sqrt(i*i + r*r)
	}
	
	public func absSquared() -> Double {
		return i*i + r*r
	}
	
	public func arg() -> Double {
		switch r {
		case _ where r>0:
			return atan(i/r)
			
		case _ where r<0 && i>=0:
			return atan(i/r) + .pi
			
		case _ where r<0 && i<0:
			return atan(i/r) - .pi
			
		case _ where r==0 && i>0:
			return .pi/2
			
		case _ where r==0 && i<0:
			return -.pi/2
			
		default:
			return Double.nan
		}
	}
}

// Equality tests need to be defined outside the struct's {}

func ==(lhs: Complex, rhs: Complex) -> Bool {
	return lhs.r==rhs.r && lhs.i==rhs.i
}
