//
//  KeySlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

import Foundation

public class KeySlave {
	
	public enum Instruction: String {
		
		case moveUp = "U"
		case moveRight = "R"
		case moveDown = "D"
		case moveLeft = "L"
		
	}
	
	private var instructionSet = [[Instruction]]()
	private var keyPad: KeyPad
	
	public init(actionInput input: String, keyPad: KeyPad = KeyPad()) {
		
		self.keyPad = keyPad
		self.instructionSet = readInstructions(fromInput: input)
	}
	
	public func runInstructionSets() -> [String] {
		
		return instructionSet.map { runInstructions(instructions: $0) }
		
	}
	
	public func runInstructions(instructions: [Instruction]) -> String {
		
		instructions.forEach { runInstruction(instruction: $0) }
		return keyPad.currentKey()
		
	}
	
	public func runInstruction(instruction: Instruction) {
		
		switch(instruction) {
		case .moveUp:
			keyPad.moveUp()
			break
		case .moveRight:
			keyPad.moveRight()
			break
		case .moveDown:
			keyPad.moveDown()
			break
		case .moveLeft:
			keyPad.moveLeft()
			break
		}
		
	}
	
	private func readInstructions(fromInput input: String) -> [[Instruction]] {
		
		return input.components(separatedBy: "\n")
			.map { Array($0.characters).map { Instruction(rawValue: String($0))! } }
			.filter{ $0.count > 1 }
		
	}
	
}
