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
  private let getThemeUseCase: GetThemeUseCase
  
  var isDarkTheme: Bool {
    getThemeUseCase.execute() == .DARK ? true : false
  }
  
  init() {
    let container = DIContainer.shared
    self.changeThemeUseCase = container.resolve(ChangeThemeUseCase.self)!
    self.getThemeUseCase = container.resolve(GetThemeUseCase.self)!
  }
  
  func changeTheme(isDarkEnabled: Bool) {
    let newType: ThemeType = isDarkEnabled == true ? .DARK : .LIGHT
    changeThemeUseCase.execute(themeType: newType)
  }
}
