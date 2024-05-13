//
//  FilterViewController.swift
//  employee-list
//
//  Created by Erkhaan  on 13.05.2024.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Domain

final class FilterViewController: UIViewController {
  
  // MARK: - Properties
  
  private let viewModel = FilterViewModel()
  
  // MARK: - Views
  
  private let ageLabel: UILabel = {
    let label = UILabel()
    label.text = "Age"
    label.font = .systemFont(ofSize: 20.0, weight: .bold)
    label.isHighlighted = true
    return label
  }()
  
  private let fromTextField: TextFieldWithPadding = {
    let textField = TextFieldWithPadding()
    textField.placeholder = "From"
    textField.keyboardType = .numberPad
    textField.backgroundColor = .systemGray5
    textField.layer.cornerRadius = 8.0
    return textField
  }()
  
  private let toTextField: TextFieldWithPadding = {
    let textField = TextFieldWithPadding()
    textField.placeholder = "To"
    textField.keyboardType = .numberPad
    textField.backgroundColor = .systemGray5
    textField.layer.cornerRadius = 8.0
    return textField
  }()
  
  // MARK: - VC lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  // MARK: - Setup UI
  
  private func setupViews() {
    setupNavigationBar()
    view.backgroundColor = .systemBackground
    
    let stackView = UIStackView(arrangedSubviews: [ageLabel, fromTextField, toTextField])
    stackView.axis = .vertical
    stackView.spacing = 20.0
    
    view.addSubview(stackView)
    
    stackView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
      $0.left.right.equalToSuperview().inset(20.0)
    }
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissNumberPad))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc private func dismissNumberPad() {
    view.endEditing(true)
  }
  
  private func setupNavigationBar() {
    navigationItem.title = "Filter"
    let applyButton = UIBarButtonItem(
      title: "Apply",
      style: .done,
      target: self,
      action: #selector(applyButtonTapped))
    let cancelButton = UIBarButtonItem(
      title: "Cancel",
      style: .plain,
      target: self,
      action: #selector(cancelButtonTapped))
    navigationItem.rightBarButtonItem = applyButton
    navigationItem.leftBarButtonItem = cancelButton
  }
  
  // MARK: - Actions
  
  @objc private func applyButtonTapped() {
    dismiss(animated: true)
    viewModel.filterEmployees(
      with: Filter(
        fromAge: Int(fromTextField.text ?? ""),
        toAge: Int(toTextField.text ?? "")
      )
    )
  }
  
  @objc private func cancelButtonTapped() {
    dismiss(animated: true)
  }
}
