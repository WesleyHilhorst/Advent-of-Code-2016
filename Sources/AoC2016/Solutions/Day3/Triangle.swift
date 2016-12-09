//
//  Triangle.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public struct Triangle {
	
	var sideA: Int
	var sideB: Int
	var sideC: Int
	
	func isValid() -> Bool {
		
		return sideA + sideB > sideC && sideB + sideC > sideA && sideC + sideA > sideB
		
	}
	
}
