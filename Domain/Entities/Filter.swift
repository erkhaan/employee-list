//
//  Filter.swift
//  Domain
//
//  Created by Erkhaan  on 13.05.2024.
//

import Foundation

public final class Filter {
  public var fromAge: Int?
  public var toAge: Int?

  public init(fromAge: Int?, toAge: Int?) {
    self.fromAge = fromAge
    self.toAge = toAge
  }
}
