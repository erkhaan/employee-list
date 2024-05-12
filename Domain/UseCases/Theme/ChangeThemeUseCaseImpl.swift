//
//  ChangeThemeUseCaseImpl.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

final public class ChangeThemeUseCaseImpl {
  private let repository: ThemeRepositoryProtocol
  
  public init(repository: ThemeRepositoryProtocol) {
    self.repository = repository
  }
}

extension ChangeThemeUseCaseImpl: ChangeThemeUseCase {
  public func execute(themeType newType: ThemeType) {
    repository.setTheme(with: newType)
  }
}
