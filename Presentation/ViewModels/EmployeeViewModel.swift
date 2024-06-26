//
//  EmployeeViewModel.swift
//  DataLayer
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Domain

struct EmployeeViewModel {
  let id: Int
  let name: String
  let dateOfBirth: String
  let dateOfEmployment: String
  let age: Int
  let experience: Int
  
  init(employee: Employee) {
    self.id = employee.id
    self.name = employee.name
    self.dateOfBirth = DateFormatter.formatDate(employee.dateOfBirth)
    self.dateOfEmployment = DateFormatter.formatDate(employee.dateOfEmployment)
    self.age = employee.age
    self.experience = employee.experience
  }
}
