//
//  VersionDataRepository.swift
//  Data
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Domain

final public class ThemeDataRepository {
  private var themeType = ThemeType.LIGHT
  public init() {}
}

extension ThemeDataRepository: ThemeRepositoryProtocol {
  
  public var getTheme: ThemeType {
    themeType
  }
  
  public func changeTheme(with newType: ThemeType) {
    themeType = newType
  }
}
