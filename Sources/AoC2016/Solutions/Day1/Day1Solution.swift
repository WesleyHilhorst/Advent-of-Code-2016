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
		
		let coordinates = slave.walk.coordinates
		let blocksDistance = coordinates.absoluteDitanceFromZero()
		
		return "HQ is at \(coordinates) and is \(blocksDistance) away"

	}
	
	public func solveGoldStar(input: String) -> String {
		
		let slave = WalkSlave(actionInput: input)
		
		// Keep track of previously visited coordinates
		var history = [Coordinates]()
		
		// Run actions and see if we have been there before
		for action in slave.actions {
		
			slave.performAction(action: action)
			
			// Only do the history stuff when actually moving forward
			if action != .forward {
				continue
			}
			
			let newCoordinates = slave.walk.coordinates
			if history.contains(newCoordinates) {
				
				// We have been here before, stop walking!
				break
				
			}
			
			history.append(newCoordinates)
			
		}
		
		let coordinates = slave.walk.coordinates
		let blocksDistance = coordinates.absoluteDitanceFromZero()
		
		return "HQ is at \(coordinates) and is \(blocksDistance) away"

	}
	
}
