//
//  TriangleSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public class TriangleSlave {
	
	private(set) var triangles = [Triangle]()

	public init(actionInput input: String) {
		
		triangles = readTriangles(fromInput: input)
		
	}
	
	public func countValidTriangles() -> Int {
		
		return triangles
			.filter { $0.isValid() }
			.count
		
	}
	
	private func readTriangles(fromInput input: String) -> [Triangle] {
		
		return input.components(separatedBy: "\n")
			.filter { $0.characters.count > 0 }
			.map { self.convertStringToTriangle(string: $0) }

	}
	
	private func convertStringToTriangle(string: String) -> Triangle {

		let sideAEndIndex = string.index(string.startIndex, offsetBy: 5)
		let sideBEndIndex = string.index(string.startIndex, offsetBy: 10)
		
		let sideA = string.substring(to: sideAEndIndex)
		let sideB = string.substring(with: sideAEndIndex..<sideBEndIndex)
		let sideC = string.substring(from: sideBEndIndex)
		
		return Triangle(
			sideA: parseSide(sideA),
			sideB: parseSide(sideB),
			sideC: parseSide(sideC)
		)
		
	}
	
	private func parseSide(_ sideString: String) -> Int {
		
		return Int(sideString.trimmingCharacters(in: .whitespacesAndNewlines))!
		
	}
	
}
