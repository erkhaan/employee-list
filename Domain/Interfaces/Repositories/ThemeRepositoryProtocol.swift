//
//  ThemeRepositoryProtocol.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

public protocol ThemeRepositoryProtocol {
  var getTheme: ThemeType { get }
  func changeTheme(with newType: ThemeType) 
}
