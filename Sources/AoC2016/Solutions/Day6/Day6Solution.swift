//
//  Day6Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 11/12/2016.
//
//

class Day6Solution: Solution {
	
	var day: Int {
		get {
			return 6
		}
	}
	
	func solveSilverStar(input: String) -> String {
		
		let slave = NoiseCancelSlave(rowsInput: input)
		
		return "Noise removed: \(slave.cancelNoise())"
		
	}
	
	func solveGoldStar(input: String) -> String {
		
		let slave = NoiseCancelSlave(rowsInput: input)
		
		return "Noise removed: \(slave.cancelNoise(reverse: true))"
		
	}
	
}
