//
//  SettingsPresenter.swift
//  employee-list
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Domain
import Swinject

final class SettingsPresenter {
  private let themeRepository: ThemeRepositoryProtocol
  
  var themeType: ThemeType {
    themeRepository.getTheme
  }
  
  init() {
    self.themeRepository = DIContainer.shared.resolve(ThemeRepositoryProtocol.self)!
  }
}
