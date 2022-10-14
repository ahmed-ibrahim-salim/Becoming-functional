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
    associatedtype A1
    associatedtype B
    
    func call(customer: A1)-> B
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
    
    class CustomerName: Function1 {
        typealias A1 = Customer
        typealias B = String

        func call(customer: Customer)-> String{
            return customer.name
        }
    }
    class CustomerAddress: Function1 {
        typealias A1 = Customer
        typealias B = String

        func call(customer: Customer)-> String{
            return customer.address
        }
    }
    
    class CustomerState: Function1 {
        typealias A1 = Customer
        typealias B = String

        func call(customer: Customer)-> String{
            return customer.state
        }
    }
    class CustomerAsCustomer: Function1 {
        typealias A1 = Customer
        typealias B = Customer

        func call(customer: Customer)-> Customer{
            return customer
        }
    }
    class CustomerDomain: Function1 {
        typealias A1 = Customer
        typealias B = String

        func call(customer: Customer)-> String{
            return customer.domain
        }
    }
    func getEnabledCustomers() throws -> [Customer]{
        return try getEnabledCustomerField(functionProtocol: CustomerAsCustomer())
    }
    func getEnabledCustomerPrimaryContacts() throws -> [String]{
        return try getEnabledCustomerField(functionProtocol: CustomerDomain())
    }
    
    func getEnabledCustomerStates() throws -> [String]{
        return try getEnabledCustomerField(functionProtocol: CustomerState())
    }

    func getEnabledCustomerNames() throws -> [String]{
        return try getEnabledCustomerField(functionProtocol: CustomerName())
    }

    func getEnabledCustomerAdresses() throws -> [String]{
        return try getEnabledCustomerField(functionProtocol: CustomerAddress())
    }
    
    // loops with a certain condition, this condition is injected from the begining
    func getEnabledCustomerField<T: Function1>(functionProtocol: T)throws -> [T.B]{
        var outList = [T.B]()
        
        for customer in allCustomers {
            if customer.enabled{
                outList.append(functionProtocol.call(customer: customer as! T.A1))
            }
        }
        return outList
    }
}
