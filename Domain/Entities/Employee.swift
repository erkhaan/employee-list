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
  
  public init(id: Int, name: String, dateOfBirth: Date, dateOfEmployment: Date) {
    self.id = id
    self.name = name
    self.dateOfBirth = dateOfBirth
    self.dateOfEmployment = dateOfEmployment
  }
}
