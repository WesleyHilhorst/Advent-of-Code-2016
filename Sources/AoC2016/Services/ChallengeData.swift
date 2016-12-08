//
//  ChallengeData.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 08/12/2016.
//
//

import RxSwift

public protocol ChallengeData {
	
	func getChallengeData(day: Int) -> Observable<String>
	
}
