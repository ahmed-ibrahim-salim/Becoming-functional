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
    
    func setBeginDate(beginDate: String)->Contract{
        self.begin_date = beginDate
        return self
    }
    func setEndDate(endDate: String)->Contract{
        self.end_date = endDate
        return self
    }
    func setEnabled(enabled: Bool)->Contract{
        self.enabled = enabled
        return self
    }
    
    func setContractForCustomer(customerId: Int, status: Bool){
        
        Customer.allCustomers.filter({ customer in
            customer.id == customerId
        }).map({ customer in
            customer.contract.setEnabled(enabled: status)
        }).forEach({ contract in
            print(contract)
        })
    }
    
}
