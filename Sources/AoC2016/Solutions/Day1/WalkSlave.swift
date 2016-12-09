//
//  WalkSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public class WalkSlave {
	
	public enum Action: String {
		
		case turnRight = "R"
		case turnLeft = "L"
		case moveForward
		
	}
	
	fileprivate(set) var actions = [Action]()
	fileprivate(set) var walk = Walk()
	
	public init(actionInput input: String) {
		
		actions = readActions(fromInput: input)
		
	}
	
	public func readActions(fromInput input: String) -> [Action] {
		
		return input.components(separatedBy: ",")
			.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
			.flatMap { self.convertInstructionToActions(instruction: $0) }
		
	}
	
	public func performAllActions() {
		
		actions.forEach{ performAction(action: $0) }
		
	}
	
	public func performAction(action: Action) {
		
		switch action {
			
		case .turnRight:
			walk.turnRight()
			
			break
		case .turnLeft:
			walk.turnLeft()
			
			break
		case .moveForward:
			walk.moveForward()
			
			break
			
		}
		
	}
	
	private func convertInstructionToActions(instruction: String) -> [Action] {
		
		let trimmedInstruction = instruction.trimmingCharacters(in: .whitespacesAndNewlines)
		
		let rawActionIndex = trimmedInstruction.index(trimmedInstruction.startIndex, offsetBy: 1)
		let rawAction = trimmedInstruction.substring(to: rawActionIndex)
		let rawCount = Int(trimmedInstruction.substring(from: rawActionIndex))!
		
		// Define if we will be going left or right
		var instructionActions: [Action] = [
			Action(rawValue: rawAction)!
		]
		
		// For every count we will have a forward move
		for _ in 1...rawCount {
			
			instructionActions.append(
				.moveForward
			)
			
		}
		
		return instructionActions
		
	}
	
}
