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
  private let changeThemeUseCase: ChangeThemeUseCase
  private let themeRepository: ThemeRepositoryProtocol
  
  var isDarkTheme: Bool {
    themeRepository.getTheme == .DARK ? true : false
  }
  
  init() {
    let container = DIContainer.shared
    self.changeThemeUseCase = container.resolve(ChangeThemeUseCase.self)!
    self.themeRepository = container.resolve(ThemeRepositoryProtocol.self)!
  }
  
  func changeTheme(isDarkEnabled: Bool) {
    let newType: ThemeType = isDarkEnabled == true ? .DARK : .LIGHT
    changeThemeUseCase.changeTheme(with: newType)
  }
}
