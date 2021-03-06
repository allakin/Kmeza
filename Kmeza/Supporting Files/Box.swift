//
//  Box.swift
//  Kmeza
//
//  Created by Pavel Anpleenko on 08.02.2021.
//

import Foundation

class Box<T> {
	typealias Listener = ((T) -> Void)
	
	var value: T {
		didSet {
			listener?(value)
		}
	}
	
	var listener: Listener?
	
	init(value: T) {
		self.value = value
	}
	
	func bind(listener: @escaping Listener) {
		self.listener = listener
		listener(value)
	}
}
