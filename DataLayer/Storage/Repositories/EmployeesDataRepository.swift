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
      Employee(id: 1, name: "John Doe", dateOfBirth: Date(), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 10)),
      Employee(id: 2, name: "Bundle Doe", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 44), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 20)),
      Employee(id: 3, name: "Alice Bundle", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 33), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 5)),
      Employee(id: 4, name: "Bob Doe", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 22), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 8)),
      Employee(id: 5, name: "Employee Doe", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 11), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 4)),
      Employee(id: 6, name: "John Employee", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 5), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 3)),
      Employee(id: 7, name: "Observable Employee Employee", dateOfBirth: Date(timeIntervalSinceNow: -31536000), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 2)),
      Employee(id: 8, name: "GoogleService GoogleService GoogleService", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 100), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 200)),
      Employee(id: 9, name: "Old Old Old", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 2024), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 1000)),
      Employee(id: 10, name: "Sample Sample Sample", dateOfBirth: Date(timeIntervalSinceNow: -31536000 * 1000), dateOfEmployment: Date(timeIntervalSinceNow: -31536000 * 55))
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
