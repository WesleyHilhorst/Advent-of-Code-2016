//
//  Day8Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 13/12/2016.
//
//

public class Day8Solution: Solution {
	
	public var day: Int {
		get {
			return 8
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let slave = ScreenSlave(instructionsInput: input)
		
		// Reset the screen to be a specific size
		slave.resetScreen(width: 50, height: 6)
		
		// Run all of the instructions
		slave.runInstructions()

		return "Number of lights on \(slave.countEnabledPixels())"
		
	}
	
	public func solveGoldStar(input: String) -> String {
		
		let slave = ScreenSlave(instructionsInput: input)
		
		// Reset the screen to be a specific size
		slave.resetScreen(width: 50, height: 6)
		
		// Run all of the instructions
		slave.runInstructions()
		
		// Print instructions
		slave.printScreen()
		
		return "Read the above parsed screen"
		
	}
	
}
