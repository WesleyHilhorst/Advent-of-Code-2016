//
//  RoomSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 10/12/2016.
//
//

import Foundation

public class RoomSlave {
	
	private(set) var rooms = [Room]()
	
	public init(roomInput input: String) {
		
		rooms = input.components(separatedBy: "\n")
			.filter { $0.characters.count > 0 }
			.map { self.convertToRoom(roomString: $0) }
		
	}
	
	public func sumOfSectorIDsInRealRooms() -> Int {
		
		return rooms
			.filter { $0.isReal() }
			.map { $0.sectorID }
			.reduce(0, {$0 + $1})
		
	}
	
	public func roomForNorthPoleObjects() -> Room {
		
		return rooms
			.filter { $0.isReal() && $0.decryptedName().contains("northpole object storage") }
			.first!
		
	}
	
	private func convertToRoom(roomString: String) -> Room {
		
		let pattern = "([a-z-]*)-(\\d*)\\[([a-z]*)\\]"
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		let matches = regex.matches(in: roomString, options: [], range: NSRange(location:0, length: roomString.characters.count))
		
		let nsstring = roomString as NSString
		let name = nsstring.substring(with: matches[0].rangeAt(1))
		let sectorID = Int(nsstring.substring(with: matches[0].rangeAt(2)))!
		let checksum = nsstring.substring(with: matches[0].rangeAt(3))

		return Room(
			name: name,
			sectorID: sectorID,
			checksum: checksum
		)
		
	}
	
}
