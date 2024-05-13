//
//  DisplayingEmployeesRepositoryProtocol.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation
import RxSwift

public protocol DisplayingEmployeesRepositoryProtocol {
  var employeesToShow: BehaviorSubject<[Employee]> { get }
  func sortEmployees(sortType: SortType)
  func filterEmployees(filter: Filter) 
}
