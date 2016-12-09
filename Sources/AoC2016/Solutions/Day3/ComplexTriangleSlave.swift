//
//  ComplexTriangleSlave.swift
//  AoC2016
//
//  Created by Wesley Hilhorst on 09/12/2016.
//
//

public class ComplexTriangleSlave {
	
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
		
		let lines = input.components(separatedBy: "\n")
			.filter { $0.characters.count > 0 }
		
		var triangles = [Triangle]()
		
		var i = 0
		while(i < lines.count) {
			
			let lineA = convertRowToSides(string: lines[i])
			let lineB = convertRowToSides(string: lines[i + 1])
			let lineC = convertRowToSides(string: lines[i + 2])
			
			triangles.append(
				Triangle(
					sideA: lineA.side1,
					sideB: lineB.side1,
					sideC: lineC.side1
				)
			)
			
			triangles.append(
				Triangle(
					sideA: lineA.side2,
					sideB: lineB.side2,
					sideC: lineC.side2
				)
			)
			
			triangles.append(
				Triangle(
					sideA: lineA.side3,
					sideB: lineB.side3,
					sideC: lineC.side3
				)
			)
			
			i += 3
		}

		return triangles
		
	}
	
	private func convertRowToSides(string: String) -> (side1: Int, side2: Int, side3: Int) {
		
		let sideAEndIndex = string.index(string.startIndex, offsetBy: 5)
		let sideBEndIndex = string.index(string.startIndex, offsetBy: 10)
		
		let side1 = string.substring(to: sideAEndIndex)
		let side2 = string.substring(with: sideAEndIndex..<sideBEndIndex)
		let side3 = string.substring(from: sideBEndIndex)
		
		return (parseSide(side1), parseSide(side2), parseSide(side3))
		
	}
	
	private func parseSide(_ sideString: String) -> Int {
		
		return Int(sideString.trimmingCharacters(in: .whitespacesAndNewlines))!
		
	}
	
}
