//
//  SortEmployeesUseCaseImpl.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation

final public class SortEmployeesUseCaseImpl {
  private let repository: DisplayingEmployeesRepositoryProtocol
  public init(repository: DisplayingEmployeesRepositoryProtocol) {
    self.repository = repository
  }
}

extension SortEmployeesUseCaseImpl : SortEmployeesUseCase {
  public func execute(sortType: SortType) {
    repository.sortEmployees(sortType: sortType)
  }
}
