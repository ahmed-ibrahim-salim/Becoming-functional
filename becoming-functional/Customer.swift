//
//  Customer.swift
//  becoming-functional
//
//  Created by magdy khalifa on 12/10/2022.
//

import Foundation

enum FindCustomer: Error{
    case wrongField
}

class Customer{
    
    var allCustomers = [Customer]()
    var id = 0
    
    var name = ""
    var address = ""
    var state = ""
    var primaryContact = ""
    var domain = ""
    var enabled = true
    
    init(){}
    
    func getEnabledCustomerField(field: String)throws -> [String]{
        var outList = [String]()
        
        for customer in allCustomers {
            if customer.enabled{
                if(field == "name") {
                    outList.append(customer.name);
                }else if(field == "state") {
                    outList.append(customer.state);
                } else if(field == "primaryContact") {
                    outList.append(customer.primaryContact);
                } else if(field == "domain") {
                    outList.append(customer.domain);
                } else if(field == "address") {
                    outList.append(customer.address);
                }else{
                    throw FindCustomer.wrongField
                }
            }
        }
        return outList
    }
    
    
    
    
    
    func getEnabledCustomerNames()-> [String]{
        var outList = [String]()
        
        for customer in allCustomers {
            if customer.enabled{
                outList.append(customer.name)
            }
        }
        return outList
    }
    
    func getEnabledCustomerStates()-> [String]{
        var outList = [String]()
        
        for customer in allCustomers {
            if customer.enabled{
                outList.append(customer.state)
            }
        }
        return outList
    }
    
    func getEnabledCustomerPrimaryContacts()-> [String]{
        var outList = [String]()
        
        for customer in allCustomers {
            if customer.enabled{
                outList.append(customer.domain)
            }
        }
        return outList
    }
    
}
