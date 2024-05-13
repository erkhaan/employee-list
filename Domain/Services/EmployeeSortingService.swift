//
//  EmployeeSortingService.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import RxSwift

final public class EmployeeSortingService {
  static public func sort(
    _ employees: [Employee],
    with sortType: SortType
  ) -> Observable<[Employee]> {
    switch sortType {
    case .nameAsc:
      return Observable.just(employees.sorted {
        $0.name < $1.name
      }) 
    case .nameDesc:
      return Observable.just(employees.sorted {
        $0.name >= $1.name
      })
    case .idAsc:
      return Observable.just(employees.sorted {
        $0.id < $1.id
      })
    case .idDesc:
      return Observable.just(employees.sorted {
        $0.id >= $1.id
      })
    case .ageAsc:
      return Observable.just(employees.sorted {
        $0.age < $1.age
      })
    case .ageDesc:
      return Observable.just(employees.sorted {
        $0.age >= $1.age
      })
    case .expAsc:
      return Observable.just(employees.sorted {
        $0.experience < $1.experience
      })
    case .expDesc:
      return Observable.just(employees.sorted {
        $0.experience >= $1.experience
      })
    }
  }
}
