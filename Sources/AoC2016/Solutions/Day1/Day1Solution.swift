//
//  Day1Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 07/12/2016.
//
//

public class Day1Solution: Solution {
	
	public var day: Int {
		get {
			return 1
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let slave = WalkSlave(actionInput: input)
		
		// Perform all actions
		slave.performAllActions()
		
		let coordinate = slave.walk.coordinate
		let blocksDistance = coordinate.absoluteDistance()
		
		return "HQ is at \(coordinate) and is \(blocksDistance) away"

	}
	
	public func solveGoldStar(input: String) -> String {
		
		let slave = WalkSlave(actionInput: input)
		
		// Keep track of previously visited coordinates
		var history = [Coordinate]()
		
		// Run actions and see if we have been there before
		for action in slave.actions {
		
			slave.performAction(action: action)
			
			// Only do the history stuff when actually moving forward
			if action != .forward {
				continue
			}
			
			let newCoordinate = slave.walk.coordinate
			if history.contains(newCoordinate) {
				
				// We have been here before, stop walking!
				break
				
			}
			
			history.append(newCoordinate)
			
		}
		
		let coordinate = slave.walk.coordinate
		let blocksDistance = coordinate.absoluteDistance()
		
		return "HQ is at \(coordinate) and is \(blocksDistance) away"

	}
	
}
