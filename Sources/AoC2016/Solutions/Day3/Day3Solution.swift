//
//  Day3Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public class Day3Solution: Solution {
	
	public var day: Int {
		get {
			return 3
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let slave = TriangleSlave(actionInput: input)
		
		return "We got \(slave.countValidTriangles()) valid triangles"
		
	}
	
	public func solveGoldStar(input: String) -> String {
		
		return "Not yet implemented"
		
	}
	
}
