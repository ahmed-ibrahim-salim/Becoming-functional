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
    
    static let allCustomers: [Customer] = {
        let customer1 = Customer(customer_id: 1, name: "andy", state: "h",
                                 domain: "h", enabled: true, contract: Contract(begin_date: "2", end_date: "2", enabled: true),
                                 contacts: [Contact(contact_id: 1, firstName: "mido", lastName: "elm", email: "", enabled: true)])
        let customer2 = Customer(customer_id: 2, name: "ron", state: "h",
                                 domain: "h", enabled: true, contract: Contract(begin_date: "2", end_date: "2", enabled: true),
                                 contacts: [Contact(contact_id: 2, firstName: "gon", lastName: "her", email: "", enabled: false)])
        let customer3 = Customer(customer_id: 2, name: "hermoine", state: "h",
                                 domain: "h", enabled: true, contract: Contract(begin_date: "2", end_date: "2", enabled: true),
                                 contacts: [Contact(contact_id: 3, firstName: "harry", lastName: "her", email: "", enabled: false)])
        return [customer1, customer2, customer3]
    }()
    
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
    
    init(customer_id: Int = 0 , name: String = "",
         state: String = "", domain: String = "",
         enabled: Bool = true, contract: Contract,
         contacts: [Contact] = [Contact]()) {
        self.id = customer_id
        self.name = name
        self.state = state
        self.domain = domain
        self.enabled = enabled
        self.contract = contract
        self.contacts = contacts
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
    
    func sendEnabledCustomersEmails(){
        eachEnabledContact(closure: { contact in
            contact.sendEmail("hello")
        })
    }
    
    func eachEnabledContact(closure: (Contact)->Void){
        Customer.allCustomers.filter({ customer in
            customer.enabled && customer.contract.enabled
        }).forEach({ customer in
            customer.contacts.filter({ contact in
                contact.enabled
            }).forEach({ contact in
                closure(contact)
            })
        })
    }
    static func updateContractForCustomerList(ids: [Int], closure: (Contract)->Contract)->[Customer]{
        updateCustomerByIdList(ids: ids, closure: { customer in
            Customer(customer_id: customer.id,
                     name: customer.name, state: customer.state,
                     domain: customer.domain, enabled: customer.enabled,
                     contract: closure(customer.contract),
                     contacts: customer.contacts)
        })
        
    }
    //
    func countEnabledCustomersWithNoEnabledContacts(customers: [Customer])->Int{
        if customers.isEmpty{
            return 0
        }else{
            
            let addition = (customers[0].enabled && customers[0].contacts.contains(where: { $0.enabled == false}) ) ? 1 : 0
            
            return addition + countEnabledCustomersWithNoEnabledContacts(customers: Array(customers[1...]))
            
        }
        
//        Customer.allCustomers.filter({ customer in
//            customer.enabled && customer.contacts.contains(where: { contact in contact.enabled == false})
//        }).count
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
