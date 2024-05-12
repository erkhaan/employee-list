//
//  GetEmployeesUseCase.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import RxSwift

public protocol GetEmployeesUseCase {
  func execute() -> Observable<[Employee]>
}
