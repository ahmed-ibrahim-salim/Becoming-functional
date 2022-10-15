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
    
    func test_getEnabledCustomerNames_ReturnsEnabledNames(){
        // given
        let customer1 = Customer(); customer1.enabled = true; customer1.name = "Mido"
        let customer2 = Customer(); customer2.enabled = false; customer2.name = "Luca"
        
        // when
        sut.allCustomers.append(customer1)
        sut.allCustomers.append(customer2)
        
        // then
        let enabledName = sut.getEnabledCustomerNames()[0]
        XCTAssertEqual(sut.allCustomers[0].name, enabledName)
        
    }

}
