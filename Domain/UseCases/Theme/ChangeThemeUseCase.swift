//
//  ChangeThemeUseCase.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

public protocol ChangeThemeUseCase {
  func execute(themeType: ThemeType)
}
