//
//  UITextField+Ext.swift
//  employee-list
//
//  Created by Erkhaan  on 13.05.2024.
//

import UIKit

final class TextFieldWithPadding: UITextField {
  var textPadding = UIEdgeInsets(
    top: 10,
    left: 20,
    bottom: 10,
    right: 20
  )
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
}
