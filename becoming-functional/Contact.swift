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
    
    func sendEmail(_ msg: String){
        
        print("""
                Hello \(firstName) \(lastName),
                We would like to let you know that a new product is available for you to try. Please feel
                free to give us a call at 1-800-555-1983 if you would like to see this product in action.
                Sincerely, Your Friends at XXY
                """)
    }
}
