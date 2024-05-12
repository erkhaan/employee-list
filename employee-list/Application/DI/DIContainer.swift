//
//  DIContainer.swift
//  employee-list
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Swinject
import Domain
import DataLayer

final class DIContainer {
  static let shared: Container = {
    let container = Container()
    
    // MARK: - Repositories
    
    container.register(ThemeRepositoryProtocol.self) { _ in
      return ThemeDataRepository()
    }.inObjectScope(.container)
    
    container.register(EmployeesRepositoryProtocol.self) { _ in
      return EmployeesDataRepository()
    }.inObjectScope(.container)
    
    // MARK: - UseCases
    
    container.register(GetThemeUseCase.self) { r in
      return GetThemeUseCaseImpl(
        repository: r.resolve(ThemeRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(ChangeThemeUseCase.self) { r in
      return ChangeThemeUseCaseImpl(
        repository: r.resolve(ThemeRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(GetEmployeesUseCase.self) { r in
      return GetEmployeesUseCaseImpl(
        repository: r.resolve(EmployeesRepositoryProtocol.self)!)
    }.inObjectScope(.container)

    container.register(SortEmployeesUseCase.self) { _ in
      return SortEmployeesUseCaseImpl()
    }.inObjectScope(.container)
    
    return container
  }()
}
