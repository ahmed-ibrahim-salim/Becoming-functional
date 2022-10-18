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

    static var allCustomers = [Customer]()
    var id = 0
    var name = ""
    var address = ""
    var state = ""
    var primaryContact = ""
    var domain = ""
    var enabled = true
    var contract: Contract
    var contacts: [Contact] = [Contact]()
    
    var enabledCustomers: (Customer)->Bool  = {customer in
        customer.enabled == true
    }
    
    var disabledCustomers: (Customer)->Bool  = {customer in
        customer.enabled == false
    }
    
    init(contract: Contract){
        self.contract = contract
    }
    
    func setCustomerId(customerID: Int)->Customer{
        self.id = customerID
        return self
    }
    
    func setName(name: String)->Customer{
        self.name = name
        return self
    }
    
    func setState(state: String)->Customer{
        self.state = state
        return self
    }
    func setDomain(domain: String)->Customer{
        self.domain = domain
        return self
    }
    func setEnabled(enabled: Bool)->Customer{
        self.enabled = enabled
        return self
    }
    func setContract(contract: Contract)->Customer{
        self.contract = contract
        return self
    }
    
    func eachEnabledContact(closure: (Contact)->Void){
        Customer.allCustomers.filter({customer in
            customer.enabled && customer.contract.enabled
        }).forEach({customer in
            customer.contacts.filter({contact in
                contact.enabled == true
            }).forEach(closure)
        })
    }
    
    func sendEnabledCustomersEmails(msg: String){
        eachEnabledContact(closure: {contact in
            contact.sendEmail(msg)
        })
    }
    
    func getDisabledCustomerNames()->[String]{
        Customer.allCustomers.filter(disabledCustomers).map({customer in
            customer.name
        })
    }
    
    func getEnabledCustomerPrimaryContacts() throws -> [String]{
        Customer.allCustomers.filter(enabledCustomers).map({customer in
            customer.domain
        })
    }

    func getEnabledCustomerStates() -> [String]{
        Customer.allCustomers.filter(enabledCustomers).map({customer in
            customer.state
        })
    }

    func getEnabledCustomerNames() -> [String]{
        Customer.allCustomers.filter(enabledCustomers).map({customer in
            customer.name
        })
    }
    
    func getEnabledCustomerAdresses() -> [String]{
        Customer.allCustomers.filter(enabledCustomers).map({customer in
            customer.address
        })
    }
    
    func customerEnabledAsCustomer() -> [Customer]{
        Customer.allCustomers.filter(enabledCustomers)
    }
    
    func getEnabledCustomerSomeoneEmail(someone: String)->[String]{

        Customer.allCustomers.filter(enabledCustomers).map({customer in
            someone + "@" + customer.domain
        })
    }
    
    static func getCustomerById(inlist: [Customer], customerId: Int)->[Customer]{
        Customer.allCustomers.filter({customer in
            customer.id == customerId
        })
    }
        
//    func getField<G>(test: genericFunc<Bool>, function: genericFunc<G>)->[G]{
//        var outList = [G]()
//
//        for customer in FunctionalConcepts.filter(inlist: Customer.allCustomers,test: test) {
//            if test(customer){
//                outList.append(function(customer))
//            }
//        }
//        return outList
//    }
}
