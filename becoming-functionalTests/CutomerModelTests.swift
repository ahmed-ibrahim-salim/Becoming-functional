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
        contract = Contract(begin_date: "2")
        sut = Customer(contract: contract)
    
    }

    override func tearDownWithError() throws {
    }
    
    func test_getEnabledCustomerNames_ReturnsEnabledNames(){
        // given
        let customer1 = Customer(contract: contract); customer1.enabled = true; customer1.name = "Mido"
        let customer2 = Customer(contract: contract); customer2.enabled = false; customer2.name = "Luca"
        
        // when
        Customer.allCustomers.append(customer1)
        Customer.allCustomers.append(customer2)
        
        // then
        let enabledName = sut.getEnabledCustomerNames()[0]
        XCTAssertEqual(Customer.allCustomers[0].name, enabledName)
        
    }

}
