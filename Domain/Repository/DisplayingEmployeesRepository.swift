//
//  DisplayingEmployeesRepository.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation
import RxSwift

final public class DisplayingEmployeesRepository: DisplayingEmployeesRepositoryProtocol {
  private var employees: [Employee] = []
  private let getEmployeesFromDataRepository: GetEmployeesUseCase
  private let disposeBag = DisposeBag()
  public var employeesToShow: BehaviorSubject<[Employee]>
  
  public init(getEmployeesFromDataRepository: GetEmployeesUseCase) {
    self.getEmployeesFromDataRepository = getEmployeesFromDataRepository
    self.employees = []
    self.employeesToShow = BehaviorSubject(value: employees)
    self.getEmployeesFromDataRepository.execute().subscribe { employees in
      self.employees = employees
      self.employeesToShow = BehaviorSubject(value: employees)
    }.disposed(by: disposeBag)
  }
  
  public func sortEmployees(sortType: SortType) {
    EmployeeSortingService.sort(try! employeesToShow.value(), with: sortType).subscribe { employees in
      self.employeesToShow.onNext(employees)
    }.disposed(by: disposeBag)
  }
  
  public func filterEmployees(filter: Filter) {
    EmployeeFilteringService.filter(employees, with: filter).subscribe { employees in
      self.employeesToShow.onNext(employees)
    }.disposed(by: disposeBag)
  }
}
