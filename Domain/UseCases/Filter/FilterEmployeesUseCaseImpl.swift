//
//  FilterEmployeesUseCase.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation

final public class FilterEmployeesUseCaseImpl {
  private let repository: DisplayingEmployeesRepositoryProtocol
  public init(repository: DisplayingEmployeesRepositoryProtocol) {
    self.repository = repository
  }
}

extension FilterEmployeesUseCaseImpl : FilterEmployeesUseCase {
  public func execute(filter: Filter) {
    repository.filterEmployees(filter: filter)
  }
}
