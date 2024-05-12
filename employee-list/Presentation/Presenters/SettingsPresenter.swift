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
  
  var isDarkTheme: Bool {
    themeRepository.getTheme == .DARK ? true : false
  }
  
  init() {
    self.themeRepository = DIContainer.shared.resolve(ThemeRepositoryProtocol.self)!
  }
  
  func changeTheme(isDarkEnabled: Bool) {
    let newType: ThemeType = isDarkEnabled == true ? .DARK : .LIGHT
    themeRepository.changeTheme(with: newType)
  }
}
