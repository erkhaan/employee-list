//
//  FilterEmployeesUseCase.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation
import RxSwift

public protocol FilterEmployeesUseCase {
  func execute(filter: Filter)
}
