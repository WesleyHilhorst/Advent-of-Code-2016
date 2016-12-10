//
//  Room.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 10/12/2016.
//
//

import Foundation

public struct Room {
	
	var name: String
	var sectorID: Int
	var checksum: String
	
	public func isReal() -> Bool {
		
		// Calculate occurences of characters
		let normalizedName = name.replacingOccurrences(of: "-", with: "")
		
		var characterCountMap = [Character: Int]()
		for character in normalizedName.characters {
			characterCountMap[character] = (characterCountMap[character] ?? 0) + 1
		}
		
		// Sort the characters first on count and then on character
		let sortedName = characterCountMap
			.sorted {
				if $0.value == $1.value {
					return String(describing: $0.key) < String(describing: $1.key)
				}
				else {
					return $0.value > $1.value
				}
			}
			.map { String($0.key) }
			.prefix(5)
			.joined(separator: "")
		
		return sortedName == checksum
		
	}
	
}
