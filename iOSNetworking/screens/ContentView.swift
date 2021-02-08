//
//  ContentView.swift
//  iOSNetworking
//
//  Created by Зехниддин on 07/02/21.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    func apiEmployeeList() {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_LIST, params: AFHttp.paramsEmpty()) { (response) in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func apiEmployeeSingle(id: Int) {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_SINGLE + String(id), params: AFHttp.paramsEmpty()) { (response) in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
    func apiEmployeeCreate(employee: Employee) {
        AFHttp.post(url: AFHttp.API_EMPLOYEE_CREATE, params: AFHttp.paramsEmployeeCreate(employee: employee)) { (response) in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func apiEmployeeUpdate(employee: Employee) {
        AFHttp.put(url: AFHttp.API_EMPLOYEE_UPDATE + String(employee.id!), params: AFHttp.paramsEmployeeUpdate(employee: employee)) { (response) in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func apiEmployeeDelete(employee: Employee) {
        AFHttp.del(url: AFHttp.API_EMPLOYEE_DELETE + String(employee.id!), params: AFHttp.paramsEmpty()) { (response) in
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
            }
            
        }
    }
    
    var body: some View {
        VStack {
            Text("Networking")
                .padding()
        }
        .onAppear {
            apiEmployeeList()
            
            apiEmployeeSingle(id: 1)

            let employeeCreate = Employee(name: "Jasur", salary: "200$", age: "30")
            apiEmployeeCreate(employee: employeeCreate)

            let employeeUpdate = Employee(id: 1, name: "Mahmud", salary: "300", age: "33")
            apiEmployeeUpdate(employee: employeeUpdate)

            let employeeDelete = Employee(id: 1, name: "Mansur", salary: "400", age: "40")
            apiEmployeeDelete(employee: employeeDelete)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
