//
//  ScreenSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 13/12/2016.
//
//

import Foundation

public class ScreenSlave {
	
	var screenColumns: [[Bool]] = []
	var instructions: [String] = []
	
	public init(instructionsInput input: String) {
		
		instructions = input.components(separatedBy: "\n")
			.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
			.filter { $0.characters.count > 0 }
		
	}
	
	public func resetScreen(width: Int, height: Int) {
		
		screenColumns = [[Bool]](repeatElement([], count: height))
		
		for y in 0..<height {
			
			screenColumns[y] = Array(repeating: false, count: width)
			
		}
		
	}
	
	public func countEnabledPixels() -> Int {
		
		return screenColumns
			.flatMap { $0 }
			.filter { $0 }
			.count
		
	}
	
	private func enableRect(toX: Int, toY: Int) {
		
		for y in 0..<toY {
			
			for x in 0..<toX {
				
				screenColumns[y][x] = true
				
			}
			
		}
		
	}
	
	private func rotateX(x: Int, by count: Int) {
		
		for _ in 0..<count {
		
			let lastValue = screenColumns[screenColumns.count - 1][x]
			var nextValue = screenColumns[0][x]
			
			for y in 0..<screenColumns.count {
				
				if y < screenColumns.count - 1 {
					
					let newNextValue = screenColumns[y + 1][x]
					screenColumns[y + 1][x] = nextValue
					nextValue = newNextValue
					
				}
				else {
					
					screenColumns[0][x] = lastValue
					
				}
				
			}
			
		}
		
	}
	
	private func rotateY(y: Int, by count: Int) {

		for _ in 0..<count {
		
			var nextValue = screenColumns[y][0]
			
			for x in 0..<screenColumns[y].count {
				
				if x < screenColumns[y].count - 1 {
					
					let newNextValue = screenColumns[y][x + 1]
					screenColumns[y][x + 1] = nextValue
					nextValue = newNextValue
					
				}
				else {
					
					screenColumns[y][0] = nextValue
					
				}
				
			}
			
		}
		
	}
	
	public func runInstructions() {

		for instruction in instructions {
			
			if let rect = parseTupple(inInstruction: instruction, pattern: "(\\d+)x(\\d+)") {
				
				enableRect(toX: rect.a, toY: rect.b)
				
			}
			else if let rotate = parseTupple(inInstruction: instruction, pattern: "(rotate row y=(\\d+) by (\\d+))") {
				
				rotateY(y: rotate.a, by: rotate.b)
				
			}
			else if let rotate = parseTupple(inInstruction: instruction, pattern: "(rotate column x=(\\d+) by (\\d+))") {
			
				rotateX(x: rotate.a, by: rotate.b)
				
			}
			
		}
		
	}
	
	private func parseTupple(inInstruction instruction: String, pattern: String) -> (a: Int, b: Int)? {
		
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		let matches = regex.matches(in: instruction, options: [], range: NSRange(location: 0, length: instruction.characters.count))
		
		if matches.count == 0 {
			return nil
		}
		
		let nsstring = NSString(string: instruction)
		let firstmatch = matches[0]
		let start = firstmatch.numberOfRanges < 4 ? 1 : 2
		
		let a = Int(nsstring.substring(with: firstmatch.rangeAt(start)))!
		let b = Int(nsstring.substring(with: firstmatch.rangeAt(start + 1)))!
		
		return (a, b)
	
	}
	
	public func printScreen() {
		
		print("")
		
		for y in 0..<screenColumns.count {
			
			var row = ""
			
			for x in screenColumns[y] {
				
				row.append(x ? "XX" : "--")
				
			}
			
			print(row)
			
		}
		
		print("")
		
	}
	
}
