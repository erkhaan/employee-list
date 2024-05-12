//
//  DomainTests.swift
//  DomainTests
//
//  Created by Erkhaan  on 12.05.2024.
//

import XCTest
@testable import Domain

final class DomainTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testAgeCalculation() {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy/MM/dd"
      let dateOfBirth = dateFormatter.date(from: "2000/01/01")!
      let dateOfEmployment = dateFormatter.date(from: "2024/01/01")!
      
      let employee = Employee(id: 1, name: "Alice", dateOfBirth: dateOfBirth, dateOfEmployment: dateOfEmployment)
      
      XCTAssertEqual(employee.age, 24)
  }
  
  func testExperienceCalculation() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let dateOfBirth = dateFormatter.date(from: "2000/01/01")!
    let dateOfEmployment = dateFormatter.date(from: "2024/01/01")!
    
    let employee = Employee(id: 2, name: "Bob", dateOfBirth: dateOfBirth, dateOfEmployment: dateOfEmployment)
    
    XCTAssertEqual(employee.experience, 0)
  }
}
