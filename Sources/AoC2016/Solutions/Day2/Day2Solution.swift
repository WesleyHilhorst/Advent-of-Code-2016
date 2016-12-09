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
		
		// Create other keyPad layout
		let layout = [
			[" ", " ", "1", " ", " "],
			[" ", "2", "3", "4", " "],
			["5", "6", "7", "8", "9"],
			[" ", "A", "B", "C", " "],
			[" ", " ", "D", " ", " "]
		]
		
		let keyPad = KeyPad(keys: layout, startingPosition: Coordinate(x: 2, y: 2))
		let keySlave = KeySlave(actionInput: input, keyPad: keyPad)
		
		// Run all of the instructions
		let keys = keySlave.runInstructionSets()
		
		return "The code is: \(keys.joined(separator: ""))"
		
	}
	
}
