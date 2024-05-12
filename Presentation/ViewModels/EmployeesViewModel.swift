//
//  EmployeesViewModel.swift
//  DataLayer
//
//  Created by Erkhaan  on 12.05.2024.
//

import Domain
import RxSwift

final class EmployeesViewModel {
  var employeesViewModelSubject: BehaviorSubject<[EmployeeViewModel]> = BehaviorSubject(value: [])
  private var employeesViewModel: [EmployeeViewModel] {
    var array: [EmployeeViewModel] = []
    for employee in employees {
      array.append(EmployeeViewModel(employee: employee))
    }
    return array
  }
  private let getEmployeesUseCase: GetEmployeesUseCase
  private let sortEmployeesUseCase: SortEmployeesUseCase
  private var employees: [Employee] = []
  private let disposeBag = DisposeBag()
  
  init() {
    let container = DIContainer.shared
    self.getEmployeesUseCase = container.resolve(GetEmployeesUseCase.self)!
    self.sortEmployeesUseCase = container.resolve(SortEmployeesUseCase.self)!
    getEmployeesUseCase.execute().subscribe { employees in
      self.employees = employees
      self.employeesViewModelSubject.onNext(self.employeesViewModel)
    }.disposed(by: disposeBag)
  }
  
  func selectedSortType(_ type: SortType) {
    employees = sortEmployeesUseCase.execute(sortType: type, employees: employees)
    employeesViewModelSubject.onNext(employeesViewModel)
  }
}
