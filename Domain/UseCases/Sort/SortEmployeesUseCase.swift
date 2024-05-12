//
//  SortEmployeesUseCase.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import RxSwift

public protocol SortEmployeesUseCase {
  func execute(sortType: SortType, employees: [Employee]) -> [Employee]
}
