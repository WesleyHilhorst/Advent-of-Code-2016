//
//  Keypad.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

import Foundation

public class Keypad {
	
	private(set) var keys = [
		
		["1", "2", "3"],
		["4", "5", "6"],
		["7", "8", "9"]
		
	]

	private(set) var coordinate = Coordinate(x: 1, y: 1)
	
	public func currentKey() -> String {
		
		return keys[coordinate.y][coordinate.x]
		
	}
	
	// MARK: - Actions
	
	public func moveUp() {
		
		coordinate.y = max(0, coordinate.y - 1)
		
	}
	
	public func moveRight() {
		
		let maxWidth = keys[0].count - 1
		coordinate.x = min(maxWidth, coordinate.x + 1)
		
	}
	
	public func moveDown() {
		
		let maxHeight = keys.count - 1
		coordinate.y = min(maxHeight, coordinate.y + 1)
		
	}
	
	public func moveLeft() {
		
		coordinate.x = max(0, coordinate.x - 1)
		
	}
	
}
