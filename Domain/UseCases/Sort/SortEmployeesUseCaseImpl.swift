//
//  SortEmployeesUseCaseImpl.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

final public class SortEmployeesUseCaseImpl {
  public init() {}
}

extension SortEmployeesUseCaseImpl: SortEmployeesUseCase {
  public func execute(sortType: SortType, employees: [Employee]) -> [Employee] {
    EmployeeSortingService.sort(employees, with: sortType)
  }
}
