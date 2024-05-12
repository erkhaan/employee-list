//
//  EmployeeTableViewCell.swift
//  DataLayer
//
//  Created by Erkhaan  on 12.05.2024.
//

import UIKit
import SnapKit
import Domain

final class EmployeeTableViewCell: UITableViewCell {
  static let reuseIdentifier = "EmployeeCell"
  
  private let container: UIStackView = {
    let container = UIStackView()
    container.axis = .vertical
    container.alignment = .top
    container.spacing = 8
    return container
  }()
  
  private let idLabel = UILabel()
  private let nameLabel = UILabel()
  private let birthDay = UILabel()
  private let employmentDateLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupConstraints()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupConstraints() {
    contentView.addSubview(container)
    container.addArrangedSubview(nameLabel)
    container.addArrangedSubview(idLabel)
    container.addArrangedSubview(birthDay)
    container.addArrangedSubview(employmentDateLabel)
    container.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(20.0)
    }
  }
  
  func configure(with employee: EmployeeViewModel) {
    idLabel.text = "ID: \(employee.id)"
    nameLabel.text = "Name: \(employee.name)"
    birthDay.text = "Date of Birth: \(employee.dateOfBirth)"
    employmentDateLabel.text = "Date of Employment: \(employee.dateOfEmployment)"
  }
}
