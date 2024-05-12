//
//  ThemeRepositoryProtocol.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import RxSwift

public protocol ThemeRepositoryProtocol {
  var getTheme: ThemeType { get }
  func changeTheme(with newType: ThemeType)
  var isDarkTheme: Observable<Bool> { get }
}
