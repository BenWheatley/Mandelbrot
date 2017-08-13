//
//  ViewController.swift
//  Mandelbrot
//
//  Created by Ben Wheatley on 10/08/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var mandelbrotView: MandelbrotView! {
		didSet {
			mandelbrotView.addGestureRecognizer(UIPinchGestureRecognizer(
				target: mandelbrotView,
				action: #selector( MandelbrotView.changeScale(recognizer:) )
			))
			
			mandelbrotView.addGestureRecognizer(UIPanGestureRecognizer(
				target: mandelbrotView,
				action: #selector( MandelbrotView.changePosition(recognizer:) )
			))
			
		}
	}
	
}
