//
//  VersionDataRepository.swift
//  Data
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Domain
import RxSwift

final public class ThemeDataRepository {
  private var themeType = ThemeType.LIGHT
  private let isDarkThemeSubject: BehaviorSubject<Bool>
  public init() {
    isDarkThemeSubject = BehaviorSubject(value: themeType == .DARK ? true : false)
  }
}

extension ThemeDataRepository: ThemeRepositoryProtocol {
  public var isDarkTheme: Observable<Bool> {
    isDarkThemeSubject
  }
  
  public var getTheme: ThemeType {
    themeType
  }
  
  public func setTheme(with newType: ThemeType) {
    themeType = newType
    let newValue = themeType == .DARK ? true : false
    isDarkThemeSubject.onNext(newValue)
  }
}
