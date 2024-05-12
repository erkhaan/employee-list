//
//  EmployeesViewModel.swift
//  DataLayer
//
//  Created by Erkhaan  on 12.05.2024.
//

import Domain
import RxSwift

final class EmployeesViewModel {
  var employees: Observable<[EmployeeViewModel]> = Observable.just([])
  private let getEmployeesUseCase: GetEmployeesUseCase
  private let sortEmployeesUseCase: SortEmployeesUseCase
  
  init() {
    let container = DIContainer.shared
    self.getEmployeesUseCase = container.resolve(GetEmployeesUseCase.self)!
    self.sortEmployeesUseCase = container.resolve(SortEmployeesUseCase.self)!
    self.employees = getEmployeesUseCase.execute().map({ employees in
      var array: [EmployeeViewModel] = []
      for employee in employees {
        array.append(EmployeeViewModel(employee: employee))
      }
      return array
    })
  }
}
