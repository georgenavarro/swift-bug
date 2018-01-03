//
//  SomeClass.swift
//  SomeProject
//
//  Created by George Navarro on 1/2/18.
//  Copyright © 2018 Seventh Bit Studios. All rights reserved.
//

import Foundation

class SomeClass<SomeType> {

	enum SomeError: Error {

		case someErrorCase(SomeType)

	}

	func someFunction(someParameter: SomeType) throws {
		throw SomeError.someErrorCase(someParameter)
	}

}
