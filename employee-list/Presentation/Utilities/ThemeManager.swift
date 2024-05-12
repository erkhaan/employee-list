//
//  ThemeManager.swift
//  employee-list
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation
import Domain
import Swinject
import UIKit
import RxSwift

final class ThemeManager {
  
  private let themeRepository: ThemeRepositoryProtocol
  private let disposeBag = DisposeBag()
  static let shared = ThemeManager()
  
  private init() {
    self.themeRepository = DIContainer.shared.resolve(ThemeRepositoryProtocol.self)!
  }
  
  func setup() {
    themeRepository.isDarkTheme.subscribe { isDarkTheme in
      DispatchQueue.main.async {
        self.toggleTheme(isDarkTheme)
      }
    }.disposed(by: disposeBag)
  }
  
  func toggleTheme(_ isDarkTheme: Bool) {
    let window = UIApplication
      .shared
      .connectedScenes
      .compactMap { ($0 as? UIWindowScene)?.keyWindow }
      .last
    window?.overrideUserInterfaceStyle = isDarkTheme == true ? .dark : .light
  }
}
