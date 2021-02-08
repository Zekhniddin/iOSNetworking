//
//  Employee.swift
//  iOSNetworking
//
//  Created by Зехниддин on 08/02/21.
//

import Foundation

struct Employee: Codable {
    var id: Int?
    var name: String?
    var salary: String?
    var age: String?
    
    // create
    init(name: String, salary: String, age: String) {
        self.name = name
        self.salary = salary
        self.age = age
    }
    
    // update, delete ---> use id
    init(id: Int, name: String, salary: String, age: String) {
        self.id = id
        self.name = name
        self.salary = salary
        self.age = age
    }
}
