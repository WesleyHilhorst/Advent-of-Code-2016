//
//  Keypad.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

import Foundation

public class KeyPad {
	
	private(set) var keys = [
		
		["1", "2", "3"],
		["4", "5", "6"],
		["7", "8", "9"]
		
	]

	private(set) var coordinate = Coordinate(x: 1, y: 1)
	
	public init(keys: [[String]]? = nil, startingPosition coordinate: Coordinate? = nil) {
		
		if let keys = keys {
			self.keys = keys
		}

		if let coordinate = coordinate {
			self.coordinate = coordinate
		}
		
	}
	
	public func currentKey() -> String {
		
		return keys[coordinate.y][coordinate.x]
		
	}
	
	public func isValidPosition(x: Int, y: Int) -> Bool {
		
		if y >= 0 && y < keys.count && x >= 0 && x < keys[y].count && keys[y][x] != " " {

			return true
			
		}
		
		return false
		
	}
	
	// MARK: - Actions
	
	public func moveUp() {
		
		if isValidPosition(x: coordinate.x, y: coordinate.y - 1) {
			coordinate.y -= 1
		}
		
	}
	
	public func moveRight() {
		
		if isValidPosition(x: coordinate.x + 1, y: coordinate.y) {
			coordinate.x += 1
		}
		
	}
	
	public func moveDown() {
		
		if isValidPosition(x: coordinate.x, y: coordinate.y + 1) {
			coordinate.y += 1
		}
		
	}
	
	public func moveLeft() {
		
		if isValidPosition(x: coordinate.x - 1, y: coordinate.y) {
			coordinate.x -= 1
		}
		
	}
	
}
