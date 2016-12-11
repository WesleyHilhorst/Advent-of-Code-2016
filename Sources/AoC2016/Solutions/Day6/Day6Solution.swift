//
//  Day6Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 11/12/2016.
//
//

public class Day6Solution: Solution {
	
	public var day: Int {
		get {
			return 6
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let slave = NoiseCancelSlave(rowsInput: input)
		
		return "Noise removed: \(slave.cancelNoise())"
		
	}
	
	public func solveGoldStar(input: String) -> String {
		
		let slave = NoiseCancelSlave(rowsInput: input)
		
		return "Noise removed: \(slave.cancelNoise(reverse: true))"
		
	}
	
}
