//
//  EmployeeSortingService.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

final public class EmployeeSortingService {
  static public func sort(
    _ employees: [Employee],
    with sortType: SortType
  ) -> [Employee] {
    switch sortType {
    case .nameAsc:
      return employees.sorted {
        $0.name < $1.name
      }
    case .nameDesc:
      return employees.sorted {
        $0.name >= $1.name
      }
    case .idAsc:
      return employees.sorted {
        $0.id < $1.id
      }
    case .idDesc:
      return employees.sorted {
        $0.id >= $1.id
      }
    case .ageAsc:
      return employees.sorted {
        $0.age < $1.age
      }
    case .ageDesc:
      return employees.sorted {
        $0.age >= $1.age
      }
    case .expAsc:
      return employees.sorted {
        $0.experience < $1.experience
      }
    case .expDesc:
      return employees.sorted {
        $0.experience >= $1.experience
      }
    }
  }
}
