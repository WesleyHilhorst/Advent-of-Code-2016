//
//  Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 07/12/2016.
//
//

public protocol Solution {
	
	var day: Int { get }
	
	func solveSilverStar(input: String) -> String
	func solveGoldStar(input: String) -> String
	
}
