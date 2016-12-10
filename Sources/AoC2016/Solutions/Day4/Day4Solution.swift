//
//  Day4Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 10/12/2016.
//
//

public class Day4Solution: Solution {
	
	public var day: Int {
		get {
			return 4
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let slave = RoomSlave(roomInput: input)
		
		// Calculate the sum
		let sum = slave.sumOfSectorIDsInRealRooms()
			
		return "Sum of the sectorIDs in real rooms is: \(sum)"
		
	}
	
	public func solveGoldStar(input: String) -> String {
		
		let slave = RoomSlave(roomInput: input)
		
		let northPoleRoom = slave.roomForNorthPoleObjects()
		
		return "The room for North Pole objects is in sector: \(northPoleRoom.sectorID)"
		
	}
	
}
