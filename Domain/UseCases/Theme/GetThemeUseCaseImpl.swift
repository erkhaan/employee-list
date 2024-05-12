//
//  GetThemeUseCaseImpl.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

final public class GetThemeUseCaseImpl {
  private let repository: ThemeRepositoryProtocol
  
  public init(repository: ThemeRepositoryProtocol) {
    self.repository = repository
  }
}

extension GetThemeUseCaseImpl: GetThemeUseCase {
  public func execute() -> ThemeType {
    repository.getTheme
  }
}
