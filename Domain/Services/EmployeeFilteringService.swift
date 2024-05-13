//
//  EmployeeFilteringService.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation
import RxSwift

final public class EmployeeFilteringService {
  static public func filter(
    _ employees: [Employee],
    with filter: Filter
  ) -> Observable<[Employee]> {
    var newValue = employees
    if let fromAge = filter.fromAge {
      newValue = newValue.filter({ employee in
        employee.age >= fromAge
      })
    }
    if let toAge = filter.toAge {
      newValue = newValue.filter({ employee in
        employee.age <= toAge
      })
    }
    return Observable.just(newValue)
  }
}
