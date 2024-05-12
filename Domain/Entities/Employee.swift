//
//  Employee.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

public final class Employee {
  public let id: Int
  public let name: String
  public let dateOfBirth: Date
  public let dateOfEmployment: Date
  public var age: Int {
    differenceInYears(from: dateOfBirth)
  }
  public var experience: Int {
    differenceInYears(from: dateOfEmployment)
  }
  
  public init(id: Int, name: String, dateOfBirth: Date, dateOfEmployment: Date) {
    self.id = id
    self.name = name
    self.dateOfBirth = dateOfBirth
    self.dateOfEmployment = dateOfEmployment
  }
  
  private func differenceInYears(from startDate: Date) -> Int {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year], from: startDate, to: Date())
    return components.year ?? 0
  }
}
