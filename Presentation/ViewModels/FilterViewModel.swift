//
//  FilterViewModel.swift
//  employee-list
//
//  Created by Erkhaan  on 13.05.2024.
//

import Domain
import RxSwift

final class FilterViewModel {
  private let filterEmployeesUseCase: FilterEmployeesUseCase
  init() {
    let container = DIContainer.shared
    self.filterEmployeesUseCase = container.resolve(FilterEmployeesUseCase.self)!
  }
  
  func filterEmployees(with filter: Filter) {
    filterEmployeesUseCase.execute(filter: filter)
  }
}
