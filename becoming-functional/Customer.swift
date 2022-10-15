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
protocol Function1{
    // change return type
    typealias genericFunc<G> = (Customer)->G
}

class Customer: Function1{
    
    static var allCustomers = [Customer]()
    var id = 0
    var name = ""
    var address = ""
    var state = ""
    var primaryContact = ""
    var domain = ""
    var enabled = true
    var contract: Contract
    
    var enabledCustomers: genericFunc<Bool>  = {customer in
        return customer.enabled == true
    }
    
    var disabledCustomers: genericFunc<Bool>  = {customer in
        return customer.enabled == false
    }
    
    init(contract: Contract){
        self.contract = contract
    }
    
    func getEnabledCustomerPrimaryContacts() throws -> [String]{
        let function: genericFunc<String> = { customer in
            return customer.domain
        }
        return getField(test: enabledCustomers, function: function)
    }

    func getEnabledCustomerStates() -> [String]{
        let function: genericFunc<String> = { customer in
            return customer.state
        }
        return getField(test: enabledCustomers,function: function)
    }

    func getEnabledCustomerNames() -> [String]{
        let function: genericFunc<String> = { customer in
            return customer.name
        }
        return getField(test: enabledCustomers,function: function)
    }
    
    func getEnabledCustomerAdresses() -> [String]{
        let function: genericFunc<String> = { customer in
            return customer.address
        }
        return getField(test: enabledCustomers,function: function)
    }
    
    func customerAsCustomer() -> [Customer]{
        let function: genericFunc<Customer> = { customer in
            return customer
        }
        return getField(test: enabledCustomers,function: function)
    }
    
    func getEnabledCustomerSomeoneEmail(someone: String) throws ->[String]{
        let function: genericFunc<String> =  { customer in
            return someone + customer.domain
        }
        return getField(test: enabledCustomers,function: function)
    }
    
    static func filter(inlist: [Customer],test: (Customer)->Bool)->[Customer]{
        var outlist = [Customer]()
        for customer in inlist{
            if test(customer){
                outlist.append(customer)
            }
        }
        return outlist
    }
    
    static func getCustomerById(inlist: [Customer],customerId: Int)->[Customer]{
        let getCustomerByIdTest: (Customer)->Bool = {customer in
            return customer.id == customerId
        }
        return Customer.filter(inlist: inlist,test: getCustomerByIdTest)
    }
        
    func getField<G>(test: genericFunc<Bool>, function: genericFunc<G>)->[G]{
        var outList = [G]()
        
        for customer in Customer.filter(inlist: Customer.allCustomers,test: test) {
            if test(customer){
                outList.append(function(customer))
            }
        }
        return outList
    }
}
