//
//  ContractTests.swift
//  becoming-functionalTests
//
//  Created by Ahmad medo on 15/10/2022.
//

import XCTest
@testable import becoming_functional

class ContractTests: XCTestCase {
    var sut: Contract!
    
    override func setUpWithError() throws {
        sut = Contract(begin_date: "2", end_date: "2")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
   


}
