//
//  Coordinates.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public struct Coordinates {
	
	var x: Int = 0
	var y: Int = 0
	
	public func absoluteDitanceFromZero() -> Int {
		
		return abs(x) + abs(y)
		
	}
	
}

// MARK: - Equatable

extension Coordinates: Equatable {
	
	public static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
		
		return lhs.x == rhs.x && lhs.y == rhs.y
		
	}
	
}

// MARK: - CustomStringConvertible

extension Coordinates: CustomStringConvertible {
	
	public var description: String {
		get {
			
			return "\(x),\(y)"
			
		}
	}
	
}
