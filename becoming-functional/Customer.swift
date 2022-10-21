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
    
    static let allCustomers = [Customer]()
    let id: Int
    let name, state, domain: String
    let enabled: Bool
    let contract: Contract
    let contacts: [Contact]
    
    let enabledCustomers: (Customer)->Bool  = {customer in
        customer.enabled == true
    }
    
    let disabledCustomers: (Customer)->Bool  = {customer in
        customer.enabled == false
    }
    
    init(customer_id: Int = 0 , name: String = "", state: String = "", domain: String = "", enabled: Bool = true, contract: Contract, contacts: [Contact] = [Contact]()) {
        self.id = customer_id
        self.name = name
        self.state = state
        self.domain = domain
        self.enabled = enabled
        self.contract = contract
        self.contacts = contacts
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
    
    static func updateContractForCustomerList(ids: [Int], closure: (Contract)-> Contract)->[Customer]{
        // map returns new updated list without changing original list.
        updateCustomerByIdList(ids: ids, closure: { customer in
            Customer(customer_id: customer.id,
                            name: customer.name,
                            state: customer.state,
                            domain: customer.domain,
                            enabled: customer.enabled,
                            contract: closure(customer.contract),
                            contacts: customer.contacts)
        })
    }
    
    static func updateCustomerByIdList(ids: [Int], closure: (Customer)->Customer)->[Customer]{
        Customer.allCustomers.map({ customer in
            if ids[customer.id] >= 0{
                return closure(customer)
            }else{
                return customer
            }
        })
    }
}
