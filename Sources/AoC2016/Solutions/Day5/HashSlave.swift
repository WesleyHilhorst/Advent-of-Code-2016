//
//  HashSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 11/12/2016.
//
//

import CommonCrypto

public class HashSlave {
	
	public class func generatePassword(fromInput input: String) -> String {
		
		let input = input.trimmingCharacters(in: .whitespacesAndNewlines)
		
		var password = ""
		var count = 0
		
		while(password.characters.count < 8) {
		
			let hashInput = hash(input: input, count: count)

			if hashInput.hasPrefix("00000") {
				
				let characterArray = Array(hashInput.characters)
				password = "\(password)\(characterArray[5])"
				
			}
			
			count += 1
			
		}
		
		return password
		
	}
	
	public class func generateComplexPassword(fromInput input: String) -> String {
		
		let input = input.trimmingCharacters(in: .whitespacesAndNewlines)

		var passwordCharacters = [
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			""
		]
		
		var count = 0
		
		while(passwordCharacters.filter { $0 == "" }.count != 0) {
			
			let hashInput = hash(input: input, count: count)
			
			if hashInput.hasPrefix("00000") {
				
				let characterArray = Array(hashInput.characters)
				let characterPosition = Int(String(characterArray[5]), radix: 16)!
				
				if characterPosition >= 0 && characterPosition < 8 && passwordCharacters[characterPosition] == "" {
					
					passwordCharacters[characterPosition] = String(characterArray[6])
					
				}
				
			}
			
			count += 1
			
		}
		
		return passwordCharacters.joined(separator: "")
		
	}
	
	private class func hash(input: String, count: Int) -> String {
		
		return md5("\(input)\(count)")
		
	}
	
	private class func md5(_ string: String) -> String {
		
		let length = Int(CC_MD5_DIGEST_LENGTH)
		var digest = [UInt8](repeating: 0, count: length)
		
		if let d = string.data(using: String.Encoding.utf8) {
			_ = d.withUnsafeBytes { (body: UnsafePointer<UInt8>) in
				CC_MD5(body, CC_LONG(d.count), &digest)
			}
		}
		
		return (0..<length).reduce("") {
			$0 + String(format: "%02x", digest[$1])
		}
		
	}
	
}
