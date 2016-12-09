//
//  Walk.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public class Walk {
	
	public enum Direction: Int {
		
		case north = 0
		case east = 1
		case south = 2
		case west = 3
		
		public func leftDirection() -> Direction {
		
			return self.rawValue > 0 ? Direction(rawValue: self.rawValue - 1)! : .west
			
		}
		
		public func rightDirection() -> Direction {
			
			return self.rawValue < 3 ? Direction(rawValue: self.rawValue + 1)! : .north
			
		}
		
	}
	
	public var coordinate = Coordinate(x: 0, y: 0)
	public var direction = Direction.north
	
	// MARK: - Moving
	
	public func moveForward() {
		
		switch direction {
		case .north:
			coordinate.y += 1
			break
		case .west:
			coordinate.x -= 1
			break
		case .south:
			coordinate.y -= 1
			break
		case .east:
			coordinate.x += 1
			break
			
		}
		
	}
	
	// MARK: - Turning
	
	public func turnLeft() {
		
		direction = direction.leftDirection()
		
	}
	
	public func turnRight() {
		
		direction = direction.rightDirection()
		
	}
	
}
