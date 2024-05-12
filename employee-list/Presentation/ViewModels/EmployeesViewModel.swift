//
//  EmployeesViewModel.swift
//  DataLayer
//
//  Created by Erkhaan  on 12.05.2024.
//

import Domain
import RxSwift

final class EmployeesViewModel {
  let employees: Observable<[EmployeeViewModel]>
  
  init() {
    self.employees = Observable.just([
      EmployeeViewModel(employee: Employee(id: 1, name: "John John DoeJohn DoeJohn DoeJohn DoeJohn DoeDoe", dateOfBirth: Date(), dateOfEmployment: Date())),
      EmployeeViewModel(employee: Employee(id: 2, name: "Bundle Doe", dateOfBirth: Date(), dateOfEmployment: Date())),
      EmployeeViewModel(employee: Employee(id: 3, name: "John Bundle", dateOfBirth: Date(), dateOfEmployment: Date())),
      EmployeeViewModel(employee: Employee(id: 4, name: "Date Doe", dateOfBirth: Date(), dateOfEmployment: Date())),
      EmployeeViewModel(employee: Employee(id: 5, name: "Employee Doe", dateOfBirth: Date(), dateOfEmployment: Date())),
      EmployeeViewModel(employee: Employee(id: 6, name: "John Employee", dateOfBirth: Date(), dateOfEmployment: Date())),
      EmployeeViewModel(employee: Employee(id: 7, name: "Observable Doe", dateOfBirth: Date(), dateOfEmployment: Date())),
    ])
  }
}
