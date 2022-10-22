//
//  Contact.swift
//  becoming-functional
//
//  Created by magdy khalifa on 18/10/2022.
//

import Foundation

class Contact {
    var contact_id = 0
    var firstName = ""
    var lastName = ""
    var email = ""
    var enabled = true
    
    init(contact_id: Int, firstName: String, lastName: String, email: String, enabled: Bool) {
        self.contact_id = contact_id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.enabled = enabled
    }
    
    func updateContactForCustomer(customerID: Int,
                                  contactId: Int,
                                  closure: (Contact)->Contact)-> [Customer]{
        Customer.updateCustomerByIdList(ids: [customerID], closure: { customer in
            return Customer(customer_id: customer.id,
                            name: customer.name, state: customer.state,
                            domain: customer.domain, enabled: customer.enabled,
                            contract: customer.contract,
                            contacts: customer.contacts.map({ contact in
                if contact.contact_id == contactId{
                    return closure(contact)
                }else{
                    return contact
                }})
            )}
        )
    }
    
    func sendEmail(_ msg: String){
        
        print("""
                Hello \(firstName) \(lastName),
                We would like to let you know that a new product is available for you to try. Please feel
                free to give us a call at 1-800-555-1983 if you would like to see this product in action.
                Sincerely, Your Friends at XXY
                """)
    }
}
