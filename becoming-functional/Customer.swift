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
    
    typealias genericFunc<T,G> = (T)->G
    
    init(){}
    
    func getEnabledCustomerPrimaryContacts() throws -> [String]{
        let function: genericFunc<Customer,String> = { customer in
            return customer.domain
        }
        return try getEnabledCustomerField(function: function)
    }

    func getEnabledCustomerStates() throws -> [String]{
        let function: genericFunc<Customer,String> = { customer in
            return customer.state
        }
        return try getEnabledCustomerField(function: function)
    }

    func getEnabledCustomerNames() throws -> [String]{
        let function: genericFunc<Customer,String> = { customer in
            return customer.name
        }
        return try getEnabledCustomerField(function: function)
    }
    
    func getEnabledCustomerAdresses() throws -> [String]{
        let function: genericFunc<Customer,String> = { customer in
            return customer.address
        }
        return try getEnabledCustomerField(function: function)
    }
    
    func customerAsCustomer() throws -> [Customer]{
        let function: genericFunc<Customer,Customer> = { customer in
            return customer
        }
        return try getEnabledCustomerField(function: function)
    }
    
    func getEnabledCustomerField<T,G>(function: genericFunc<T,G>)throws -> [G]{
        var outList = [G]()
        
        for customer in allCustomers {
            if customer.enabled{
                outList.append(function(customer as! T))
            }
        }
        return outList
    }
    

//
//    func getEnabledCustomerSomeoneEmail(someone: String){
////        let customerSomeoneEmail = CustomerSomeoneEmail()
////        customerSomeoneEmail.someone = someone
//        return try getEnabledCustomerField(functionProtocol: CustomerSomeoneEmail())
//    }

}
