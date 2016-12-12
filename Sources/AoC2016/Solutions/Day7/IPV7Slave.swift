//
//  IPV7Slave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 12/12/2016.
//
//

import Foundation

public class IPV7Slave {
	
	private(set) var ipLines = [String]()
	
	public init(ipsInput input: String) {
		
		ipLines = input.components(separatedBy: "\n")
			.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
			.filter { $0.characters.count > 0 }
		
	}
	
	public func countIPsWithTLS() -> Int {
		
		return ipLines.filter { ipSupportsTLS(rawIPV7: $0) }
			.count
		
	}
	
	public func countIPsWithSSL() -> Int {
		
		return ipLines.filter { ipSupportsSSL(rawIPV7: $0) }
			.count
		
	}
	
	private func ipSupportsTLS(rawIPV7: String) -> Bool {
		
		let parts = rawIPV7.trimmingCharacters(in: .whitespacesAndNewlines)
			.characters.split { $0 == "[" || $0 == "]" }
			.map { containsAbba(string: String($0)) }
		
		var didFindAbbaOutsideBrackets = false
		var didFindAbbaWithinBrackets = false
		
		for (i, hasAbba) in parts.enumerated() {
			
			// These parts should be outside of the brackets
			if i % 2 == 0 && hasAbba {
				didFindAbbaOutsideBrackets = true
			}
			
			// These parts should be inside of the brackets
			if i % 2 == 1 && hasAbba {
				didFindAbbaWithinBrackets = true
			}
			
		}
		
		return didFindAbbaOutsideBrackets && !didFindAbbaWithinBrackets
		
	}
	
	private func ipSupportsSSL(rawIPV7: String) -> Bool {
		
		let parts = rawIPV7.trimmingCharacters(in: .whitespacesAndNewlines)
			.characters.split { $0 == "[" || $0 == "]" }
			.map { abaMatches(inString: String($0)) }
		
		// Keep track of a reversed
		var abaReversedListInsideBrackets = [String]()
		var abaListOutsideBrackets = [String]()
		
		for (i, abas) in parts.enumerated() {
			
			// These parts should be outside of the brackets
			if i % 2 == 0 {
				
				abaListOutsideBrackets += abas
				
			}
			else {

				let reversedAba = abas.map { reverseAba(aba: $0) }
				abaReversedListInsideBrackets += reversedAba
				
			}
			
		}
		
		
		
		// Compare the two lists
		for aba in abaListOutsideBrackets {
			if abaReversedListInsideBrackets.contains(aba) {
				return true
			}
		}

		return false
		
	}
	
	private func abaMatches(inString string: String) -> [String] {
		
		let pattern = "(?=((.)(?!\\1)(.)\\2))"
		
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		let matches = regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.characters.count))
	
		let nsstring = NSString(string: string)
		
		return matches
			.filter {
			
				// Make sure the middle character is different
				let outer = nsstring.substring(with: $0.rangeAt(2))
				let inner = nsstring.substring(with: $0.rangeAt(3))
				
				return outer != inner
			
			}
			.map { nsstring.substring(with: $0.rangeAt(1)) }
		
	}
	
	private func reverseAba(aba: String) -> String {
		
		let characters = Array(aba.characters)
		return "\(characters[1])\(characters[0])\(characters[1])"
		
	}
	
	private func containsAbba(string: String) -> Bool {
		
		let pattern = "(?!(\\w)\\1\\1\\1)(\\w)(\\w)\\3\\2"
		return string.range(of: pattern, options: .regularExpression) != nil
		
	}
	
}
