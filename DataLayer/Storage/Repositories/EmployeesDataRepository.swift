//
//  EmployeesDataRepository.swift
//  DataLayer
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Domain
import RxSwift

final public class EmployeesDataRepository {
  private var employees: [Employee] = {
    [
      Employee(id: 1, name: "John John DoeJohn DoeJohn DoeJohn DoeJohn DoeDoe", dateOfBirth: Date(), dateOfEmployment: Date()),
      Employee(id: 2, name: "Bundle Doe", dateOfBirth: Date(), dateOfEmployment: Date()),
      Employee(id: 3, name: "John Bundle", dateOfBirth: Date(), dateOfEmployment: Date()),
      Employee(id: 4, name: "Date Doe", dateOfBirth: Date(), dateOfEmployment: Date()),
      Employee(id: 5, name: "Employee Doe", dateOfBirth: Date(), dateOfEmployment: Date()),
      Employee(id: 6, name: "John Employee", dateOfBirth: Date(), dateOfEmployment: Date()),
      Employee(id: 7, name: "Observable Doe", dateOfBirth: Date(), dateOfEmployment: Date())
    ]
  }()
  
  public init() {
  }
}

extension EmployeesDataRepository: EmployeesRepositoryProtocol {
  public var getEmployees: Observable<[Employee]> {
    Observable.just(employees)
  }
}
