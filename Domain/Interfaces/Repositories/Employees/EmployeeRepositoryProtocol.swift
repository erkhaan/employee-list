//
//  EmployeeRepositoryProtocol.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import RxSwift

public protocol EmployeesRepositoryProtocol {
  var getEmployees: Observable<[Employee]>  { get }
}
