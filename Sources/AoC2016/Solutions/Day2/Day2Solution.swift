//
//  Day2Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

class Day2Solution: Solution {
	
	var day: Int {
		get {
			return 2
		}
	}
	
	func solveSilverStar(input: String) -> String {
		
		let keySlave = KeySlave(actionInput: input)
		
		// Run all of the instructions
		let keys = keySlave.runInstructionSets()
		
		return "The code is: \(keys.joined(separator: ""))"
		
	}
	
	func solveGoldStar(input: String) -> String {
		
		return "Not yet implemented"
		
	}
	
}
