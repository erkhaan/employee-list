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
  private let displayingEmployeesRepository: DisplayingEmployeesRepositoryProtocol
  private var employees: [Employee] = []
  private let disposeBag = DisposeBag()
  
  init() {
    let container = DIContainer.shared
    self.getEmployeesUseCase = container.resolve(GetEmployeesUseCase.self)!
    self.sortEmployeesUseCase = container.resolve(SortEmployeesUseCase.self)!
    self.displayingEmployeesRepository = container.resolve(DisplayingEmployeesRepositoryProtocol.self)!
    displayingEmployeesRepository.employeesToShow.subscribe { employees in
      self.employees = employees
      self.employeesViewModelSubject.onNext(self.employeesViewModel)
    }.disposed(by: disposeBag)
  }
  
  func selectedSortType(_ type: SortType) {
    sortEmployeesUseCase.execute(sortType: type)
    employeesViewModelSubject.onNext(employeesViewModel)
  }
}
