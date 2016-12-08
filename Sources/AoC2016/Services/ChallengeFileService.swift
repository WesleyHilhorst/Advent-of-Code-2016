//
//  ChallengeFileService.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 08/12/2016.
//
//

import RxSwift
import Foundation

public class ChallengeFileService: ChallengeData {

	public func hasInput(day: Int) -> Bool {

		let challengeFilePath = ChallengeFileService.createInputPath(day: day)
		return FileManager.default.fileExists(atPath: challengeFilePath)
		
	}
	
	public func saveChallengeData(day: Int, input: String) {
		
		let challengeFilePath = ChallengeFileService.createInputPath(day: day)
		let contents = input.data(using: .utf8)
		
		FileManager.default.createFile(atPath: challengeFilePath, contents: contents, attributes: nil)
		
	}
	
	public func getChallengeData(day: Int) -> Observable<String> {
		
		let challengeFilePath = ChallengeFileService.createInputPath(day: day)
		
		if let data = FileManager.default.contents(atPath: challengeFilePath), let string = String(data: data, encoding: .utf8) {
		
			return Observable.just(string)
			
		}
		
		let error = NSError(domain: "", code: 0, userInfo: nil)
		return Observable.error(error)
		
	}
	
	public class func createInputPath(day: Int) -> String {
		
		do {
			
			try FileManager.default.createDirectory(atPath: "./Data", withIntermediateDirectories: true, attributes: nil)
			
		}
		catch { }
		
		return "./Data/Input-Day\(day).txt"
		
	}
	
}
