//
//  GetEmployeesUseCaseImpl.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import RxSwift

final public class GetEmployeesUseCaseImpl {
  private let repository: EmployeesRepositoryProtocol
  
  public init(repository: EmployeesRepositoryProtocol) {
    self.repository = repository
  }
}

extension GetEmployeesUseCaseImpl: GetEmployeesUseCase {
  public func execute() -> Observable<[Employee]> {
    repository.getEmployees
  }
}
