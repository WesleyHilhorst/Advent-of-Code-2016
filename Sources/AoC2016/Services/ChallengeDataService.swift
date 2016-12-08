//
//  ChallengeDataService.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 08/12/2016.
//
//

import RxSwift

public class ChallengeDataService: ChallengeData {
	
	private(set) var fileService: ChallengeFileService
	private(set) var webService: ChallengeWebService
	
	public init(sessionToken: String) {
		
		webService = ChallengeWebService(sessionToken: sessionToken)
		fileService = ChallengeFileService()
		
	}
	
	public func getChallengeData(day: Int) -> Observable<String> {
		
		if fileService.hasInput(day: day) {
			
			return fileService.getChallengeData(day: day)
			
		}
		
		return webService.getChallengeData(day: day)
			.do(onNext: { (input) in
			
				self.fileService.saveChallengeData(day: day, input: input)
				
			})
		
	}
	
}
