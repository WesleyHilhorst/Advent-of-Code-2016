//
//  Day7Solution.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 12/12/2016.
//
//

public class Day7Solution: Solution {
	
	public var day: Int {
		get {
			return 7
		}
	}
	
	public func solveSilverStar(input: String) -> String {
		
		let slave = IPV7Slave(ipsInput: input)
		
		// Count the IPs with TLS (transport-layer snooping)
		let count = slave.countIPsWithTLS()
		
		return "We counted \(count) IPs with TLS"
		
	}
	
	public func solveGoldStar(input: String) -> String {
		
		let slave = IPV7Slave(ipsInput: input)
		
		// Count the IPs with TLS (transport-layer snooping)
		let count = slave.countIPsWithSSL()
		
		return "We counted \(count) IPs with SSL"
		
	}
	
}
