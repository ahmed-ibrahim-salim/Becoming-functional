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
        sut = Contract(begin_date: "2")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_setContractEnabledForCustomer_EnablesContract(){
        // given
        var customer1 = Customer(contract: sut)
        customer1.id = 0
        customer1.contract.enabled = false
        Customer.allCustomers.append(customer1)

        // when
        sut.setContractForCustomer(customerId: 0, status: true)
        
        // then
        XCTAssertTrue(customer1.contract.enabled)
    }


}
