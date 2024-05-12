//
//  ChangeThemeUseCaseImpl.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

final public class ChangeThemeUseCaseImpl: ChangeThemeUseCase {
  private let repository: ThemeRepositoryProtocol
  
  public init(repository: ThemeRepositoryProtocol) {
    self.repository = repository
  }
  
  public func changeTheme(with newType: ThemeType) {
    repository.setTheme(with: newType)
  }
}
