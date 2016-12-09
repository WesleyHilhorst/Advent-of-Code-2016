//
//  Coordinates.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public struct Coordinate {
	
	var x: Int = 0
	var y: Int = 0
	
	public func absoluteDistance() -> Int {
		
		return abs(x) + abs(y)
		
	}
	
}

// MARK: - Equatable

extension Coordinate: Equatable {
	
	public static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
		
		return lhs.x == rhs.x && lhs.y == rhs.y
		
	}
	
}

// MARK: - CustomStringConvertible

extension Coordinate: CustomStringConvertible {
	
	public var description: String {
		get {
			
			return "\(x),\(y)"
			
		}
	}
	
}
