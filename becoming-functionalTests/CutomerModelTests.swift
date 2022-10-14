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
    
    override func setUpWithError() throws {
    sut = Customer()
    
    }

    override func tearDownWithError() throws {
    }
    
    func test_getEnabledCustomerNames_ReturnsEnabledNames() throws{
        // given
        let customer1 = Customer(); customer1.enabled = true; customer1.name = "Mido"
        let customer2 = Customer(); customer2.enabled = false; customer2.name = "not mido"

        let customerName = Customer.CustomerName()
        
        // when
        sut.allCustomers.append(customer1)
        sut.allCustomers.append(customer2)
        
        // then
        let enabledName = try sut.getEnabledCustomerField(functionProtocol: customerName)[0]
        XCTAssertEqual(sut.allCustomers[0].name, enabledName)
        
    }

}