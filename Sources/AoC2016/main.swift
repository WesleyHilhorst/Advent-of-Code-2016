//
//  main.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 07/12/2016.
//
//

import RxSwift

public class Application {

	private var challengeDataService: ChallengeDataService!
	private let disposeBag = DisposeBag()
	
	private let solutions: [Solution] = [
		Day1Solution(),
		Day2Solution(),
		Day3Solution(),
		Day4Solution()
	]

	@discardableResult
	public init() {

		print("=========================================")
		print("> Advent of Code 2016 - Wesley Hilhorst <")
		print("=========================================")
		print("")
		
		if CommandLine.argc == 3 {
			
			let sessionToken = CommandLine.arguments[1]
			let dayString = CommandLine.arguments[2]
			
			if let day = Int(dayString), day > 0 && day <= solutions.count {
				
				// Create the challenge service
				challengeDataService = ChallengeDataService(sessionToken: sessionToken)
				
				// Get the current solution and try to solve it
				let solutionToSolve = solutions[day - 1]
				solve(solution: solutionToSolve)
				
			}
			else {
				
				print("Solution is not a valid day (\(dayString)) or has not been implemented (yet)")
				
			}
			
		}
		else {
			
			print("This application expects a 2 arguments:")
			print("AoC2016 <token> <day>")
			
		}
		
		print("=========================================")

	}

	private func solve(solution: Solution) {
		
		challengeDataService.getChallengeData(day: solution.day)
			.do(onNext: { (input) in
				
				print("- Result for silver")
				let resultSilver = solution.solveSilverStar(input: input)
				print("-> \(resultSilver)")
				
				print("")
				
				print("- Result for gold")
				let resultGold = solution.solveGoldStar(input: input)
				print("-> \(resultGold)")
				
				print("")
				
			}, onError: { (error) in
				
				print("Error occurred: \(error)")
				
			})
			.subscribe()
			.addDisposableTo(disposeBag)
		
	}
	
}

Application()
