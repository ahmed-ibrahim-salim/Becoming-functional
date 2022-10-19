//
//  Contract.swift
//  becoming-functional
//
//  Created by Ahmad medo on 15/10/2022.
//

import Foundation

class Contract {
    
    let begin_date: String
    let end_date: String
    let enabled: Bool
    
    init(begin_date: String, end_date: String,enabled: Bool = true) {
        self.begin_date = begin_date
        self.end_date = self.begin_date
        self.enabled = enabled
    }
    
    func setContractForCustomerList(ids: [Int], status: Bool)->[Customer]{
        
        Customer.updateContractForCustomerList(ids: ids, closure: { contract in
            Contract(begin_date: contract.begin_date, end_date: contract.end_date, enabled: status)
        })
    }
}
