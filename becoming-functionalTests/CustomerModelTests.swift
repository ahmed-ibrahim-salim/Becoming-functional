//
//  CutomerModelTests.swift
//  becoming-functionalTests
//
//  Created by Ahmad medo on 14/10/2022.
//

import XCTest

@testable import becoming_functional

class CutomerModelTests: XCTestCase {
    var sut: Customer!
    var contract: Contract!
    
    override func setUpWithError() throws {
        contract = Contract(begin_date: "2",end_date: "2")
        sut = Customer(contract: contract)
    
    }

    override func tearDownWithError() throws {
    }
    
    func test_countEnabledCustomersWithNoEnabledContacts(){
        let count = sut.countEnabledCustomersWithNoEnabledContacts(customers: Customer.allCustomers)
        
        XCTAssertEqual(count, 2)
    }

}
