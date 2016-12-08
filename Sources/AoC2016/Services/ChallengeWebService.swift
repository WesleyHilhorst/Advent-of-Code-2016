//
//  ChallengeWebService.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 08/12/2016.
//
//

import Foundation
import RxSwift

public enum ChallengeWebServiceError: Error {
	case noValidAuthentication
}

public class ChallengeWebService: ChallengeData {
	
	private let queue: OperationQueue = OperationQueue()
	private var sessionToken: String
	
	public init(sessionToken: String) {
		
		self.sessionToken = sessionToken
		
	}
	
	public func getChallengeData(day: Int) -> Observable<String> {
		
		return Observable.create { (observer) in
			
			let urlString = "http://adventofcode.com/2016/day/\(day)/input"			
			let sempahore = DispatchSemaphore(value: 0)
			
			var request = URLRequest(url: URL(string: urlString)!)
			request.setValue("session=\(self.sessionToken)", forHTTPHeaderField: "Cookie")
			
			URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
				
				if let error = error {
					
					observer.onError(error)
					
				}
				else if let data = data, let string = String(data: data, encoding: .utf8) {
					
					if string.range(of: "Please log in") != nil {
						
						observer.onError(ChallengeWebServiceError.noValidAuthentication)
						
					}
					else {
					
						observer.onNext(string)
						
					}
					
				}
				
				sempahore.signal()
				
			}).resume()
			
			sempahore.wait()
			observer.onCompleted()
			
			return Disposables.create()
			
		}
	
	}
	
}
