//
//  SortType.swift
//  Domain
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

public enum SortType: String {
  case nameAsc = "Name (Asc)"
  case nameDesc = "Name (Desc)"
  case idAsc = "Id (Asc)"
  case idDesc = "Id (Desc)"
  case ageAsc = "Age (Asc)"
  case ageDesc = "Age (Desc)"
  case expAsc = "Experience (Asc)"
  case expDesc = "Experience (Desc)"
  static public var allCases: [SortType] {
    return [
      .nameAsc,
      .nameDesc,
      .idAsc,
      .idDesc,
      .ageAsc,
      .ageDesc,
      .expAsc,
      .expDesc
    ]
  }
}
