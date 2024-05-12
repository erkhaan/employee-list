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
    
    container.register(ThemeRepositoryProtocol.self) { _ in
      return ThemeDataRepository()
    }.inObjectScope(.container)
    
    return container
  }()
}
