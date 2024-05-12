//
//  DataTests.swift
//  DataTests
//
//  Created by Erkhaan  on 12.05.2024.
//

import XCTest
@testable import DataLayer
import Domain
import RxSwift

final class DataTests: XCTestCase {
  
  var themeRepository: ThemeDataRepository!
  var disposeBag: DisposeBag!
  
  override func setUpWithError() throws {
    themeRepository = ThemeDataRepository()
    disposeBag = DisposeBag()
  }
  
  override func tearDownWithError() throws {
    themeRepository = nil
  }
  
  func testInitialTheme() throws {
    let themeType = themeRepository.getTheme
    XCTAssertEqual(themeType, ThemeType.LIGHT, "Initial theme should be LIGHT")
  }
  
  func testSetTheme() {
      let newThemeType: ThemeType = .DARK
      
      var isDarkThemeResult = false
      themeRepository.isDarkTheme.subscribe(onNext: { isDark in
          isDarkThemeResult = isDark
      }).disposed(by: disposeBag)
      
      themeRepository.setTheme(with: newThemeType)
      
      XCTAssertEqual(themeRepository.getTheme, newThemeType, "Theme type should be updated to \(newThemeType)")
      XCTAssertTrue(isDarkThemeResult, "isDarkTheme should be true for DARK theme")
  }
}
