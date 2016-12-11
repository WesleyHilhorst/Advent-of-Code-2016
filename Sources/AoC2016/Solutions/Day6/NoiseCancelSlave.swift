//
//  NoiseCancelSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 11/12/2016.
//
//

public class NoiseCancelSlave {
	
	private(set) var rows = [String]()
	
	public init(rowsInput input: String) {
		
		rows = input.components(separatedBy: "\n")
			.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
			.filter { $0.characters.count > 0 }
		
	}
	
	public func cancelNoise(reverse: Bool = false) -> String {
		
		return characterMapWithCount()
			.sorted { $0.key < $1.key }
			.map {
				
				let sortedMap = $0.value.sorted{
					reverse ? $0.value < $1.value : $0.value > $1.value
				}
				
				return String(sortedMap.first!.key)
				
			}
			.joined(separator: "")
		
	}
	
	private func characterMapWithCount() -> [Int: [Character: Int]] {
		
		var characterCountMap = [Int: [Character: Int]]()
		
		for row in rows {
			
			let characters = Array(row.characters)
			
			for i in 0..<row.characters.count {
				
				let character = characters[i]
				
				// Check if column exists
				if characterCountMap[i] == nil {
					characterCountMap[i] = [Character: Int]()
				}
				
				// Update the character count
				if let currentCount = characterCountMap[i]![character] {
					characterCountMap[i]![character] = currentCount + 1
				}
				else {
					characterCountMap[i]![character] = 0
				}
				
			}
			
		}
		
		return characterCountMap
		
	}
	
}
