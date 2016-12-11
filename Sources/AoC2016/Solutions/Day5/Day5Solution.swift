//
//  Day5Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 11/12/2016.
//
//

public class Day5Solution: Solution {
	
	public var day: Int {
		get {
			return 5
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let password = HashSlave.generatePassword(fromInput: input)
		return "Found password: \(password) for input: \(input)"
		
	}
	
	public func solveGoldStar(input: String) -> String {
		
		let password = HashSlave.generateComplexPassword(fromInput: input)
		return "Found password: \(password) for input: \(input)"
		
	}
	
}
