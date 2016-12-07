//
//  main.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 07/12/2016.
//
//

public class Application {

	private let requestService = RequestService()
	
	private let solutions: [Solution] = [
		Day1Solution()
	]

	@discardableResult
	init() {
		
		print("=====================================")
		print("Advent of Code 2016 - Wesley Hilhorst")
		print("=====================================")
		print("")
		
		if CommandLine.argc == 3 {
			
			let tokenString = CommandLine.arguments[1]
			let dayString = CommandLine.arguments[2]
			
			if let day = Int(dayString), day > 0 && day <= solutions.count {
				
				requestService.token = tokenString
				
				let solutionToSolve = solutions[day - 1]
				solve(solution: solutionToSolve)
				
			}
			else {
				
				print("Solution for this day (\(dayString)) has not been implemented (yet)")
				
			}
			
		}
		else {
			
			print("This application expects a 2 arguments:")
			print("AoC2016 <token> <day>")
			
		}
		
	}
	
	private func solve(solution: Solution) {
		
		print("solve: \(solution)")
		
	}
	
}

Application()
