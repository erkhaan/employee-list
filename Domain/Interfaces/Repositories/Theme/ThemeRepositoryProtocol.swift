//
//  ThemeRepositoryProtocol.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import RxSwift

public protocol ThemeRepositoryProtocol {
  var getTheme: ThemeType { get }
  var isDarkTheme: Observable<Bool> { get }
  func setTheme(with newType: ThemeType)
}
