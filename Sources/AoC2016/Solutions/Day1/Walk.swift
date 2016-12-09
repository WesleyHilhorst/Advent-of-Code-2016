//
//  Walk.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public class Walk {
	
	public enum Direction {
		
		case north
		case east
		case south
		case west
		
	}
	
	public var coordinates = Coordinates(x: 0, y: 0)
	public var direction = Direction.north
	
	// MARK: - Moving
	
	public func moveForward() {
		
		switch direction {
		case .north:
			coordinates.y = coordinates.y + 1
			break
		case .west:
			coordinates.x = coordinates.x - 1
			break
		case .south:
			coordinates.y = coordinates.y - 1
			break
		case .east:
			coordinates.x = coordinates.x + 1
			break
			
		}
		
	}
	
	// MARK: - Turning
	
	public func turnLeft() {
		
		switch direction {
		case .north:
			direction = .west
			break
		case .west:
			direction = .south
			break
		case .south:
			direction = .east
			break
		case .east:
			direction = .north
			break
		}
		
	}
	
	public func turnRight() {
		
		switch direction {
		case .north:
			direction = .east
			break
		case .east:
			direction = .south
			break
		case .south:
			direction = .west
			break
		case .west:
			direction = .north
			break
		}
		
	}
	
}