//
//  Contract.swift
//  becoming-functional
//
//  Created by Ahmad medo on 15/10/2022.
//

import Foundation

class Contract {
    
    var begin_date: String
    var end_date: String
    var enabled = false
        
    init(begin_date: String) {
        self.begin_date = begin_date
        self.end_date = self.begin_date
//        this.end_date.setTimeInMillis(this.begin_date.getTimeInMillis())
//        this.end_date.add(Calendar.YEAR, 2);
    }
            
    func setContractEnabledForCustomer(customerId: Int) {
        for customer in Customer.getCustomerById(inlist: Customer.allCustomers,customerId: customerId) {
            customer.contract.enabled = true
        }
    }
}
