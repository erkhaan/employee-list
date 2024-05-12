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
    
    container.register(GetThemeUseCase.self) { r in
      return GetThemeUseCaseImpl(
        repository: r.resolve(ThemeRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    container.register(ChangeThemeUseCase.self) { r in
      return ChangeThemeUseCaseImpl(
        repository: r.resolve(ThemeRepositoryProtocol.self)!)
    }.inObjectScope(.container)
    
    return container
  }()
}
