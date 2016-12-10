//
//  Room.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 10/12/2016.
//
//

import Foundation

public struct Room {
	
	static let allowedAlphabet = "abcdefghijklmnopqrstuvwxyz"
	
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
			.joined(separator: "") == checksum
		
	}
	
	public func decryptedName() -> String {
		
		let characters = name.replacingOccurrences(of: "-", with: " ").characters
		
		let numberOfCharacters = Room.allowedAlphabet.characters.count
		var decryptedName = ""
		
		for character in characters {
			if Room.allowedAlphabet.characters.contains(character) {
				
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
		
		let endIndex = Room.allowedAlphabet.characters.index(of: char)!
		return Room.allowedAlphabet.distance(from: Room.allowedAlphabet.startIndex, to: endIndex)
		
	}
	
	private func characterForPosition(pos: Int) -> Character {
		
		return Array(Room.allowedAlphabet.characters)[pos - 1]
		
	}
	
}
