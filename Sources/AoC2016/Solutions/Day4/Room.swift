//
//  Room.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 10/12/2016.
//
//

import Foundation

public struct Room {
	
	static let nameAlphabet = "abcdefghijklmnopqrstuvwxyz"
	
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
		return characterCountMap
			.sorted { ($0.value != $1.value) ? $0.value > $1.value : $0.key < $1.key }
			.map { String($0.key) }
			.prefix(5)
			.joined(separator: "") == checksum
		
	}
	
	public func decryptedName() -> String {
		
		let characters = name.replacingOccurrences(of: "-", with: " ").characters
		
		let numberOfCharacters = Room.nameAlphabet.characters.count
		var decryptedName = ""
		
		for character in characters {
			if Room.nameAlphabet.characters.contains(character) {
				
				let position = sectorID % numberOfCharacters + (self.alphabeticalPosition(char: character) + 1)
				
				if position > numberOfCharacters {
					
					decryptedName.append(
						characterForPosition(pos: position - numberOfCharacters)
					)
					
				}
				else {
					
					decryptedName.append(
						characterForPosition(pos: position )
					)
					
				}
				
			}
			else {
				
				decryptedName.append(character)
				
			}
		}
		
		return decryptedName
		
	}
	
	private func alphabeticalPosition(char: Character) -> Int {
		
		let endIndex = Room.nameAlphabet.characters.index(of: char)!
		return Room.nameAlphabet.distance(from: Room.nameAlphabet.startIndex, to: endIndex)
		
	}
	
	private func characterForPosition(pos: Int) -> Character {
		
		return Array(Room.nameAlphabet.characters)[pos - 1]
		
	}
	
}
