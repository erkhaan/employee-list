//
//  ViewController.swift
//  employee-list
//
//  Created by Erkhaan  on 11.05.2024.
//

import UIKit
import RxSwift
import RxCocoa
import Domain

final class EmployeesViewController: UIViewController {
  
  // MARK: - Properties
  
  private let viewModel = EmployeesViewModel()
  private let disposeBag = DisposeBag()
  private let tableView = UITableView()
  
  // MARK: - VC lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  // MARK: - Setup UI
  
  private func setupViews() {
    setupNavigationBar()
    setupTableView()
  }
  
  private func setupNavigationBar() {
    let settingsButton = UIBarButtonItem(
      image: UIImage(systemName: "gear"),
      style: .plain,
      target: self,
      action: #selector(settingsButtonTapped))
    let sortButton = UIBarButtonItem(
      image: UIImage(systemName: "arrow.up.arrow.down"),
      style: .plain,
      target: self,
      action: #selector(sortButtonTapped))
    let filterButton = UIBarButtonItem(
      image: UIImage(systemName: "line.horizontal.3.decrease.circle"),
      style: .plain,
      target: self,
      action: #selector(filterButtonTapped))
    navigationItem.leftBarButtonItems = [filterButton, sortButton]
    navigationItem.rightBarButtonItem = settingsButton
    navigationItem.title = "Employees List"
  }
  
  private func setupTableView() {
    tableView.frame = view.bounds
    tableView.delegate = self
    tableView.register(
      EmployeeTableViewCell.self,
      forCellReuseIdentifier: EmployeeTableViewCell.reuseIdentifier)
    view.addSubview(tableView)
    viewModel.employeesViewModelSubject
      .bind(to: tableView.rx.items) { tableView, row, viewModel in
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.reuseIdentifier, for: IndexPath(row: row, section: 0)) as! EmployeeTableViewCell
        cell.configure(with: viewModel)
        return cell
      }.disposed(by: disposeBag)
    tableView.rx.itemSelected
      .subscribe(onNext: { [weak self] indexPath in
        self?.tableView.deselectRow(at: indexPath, animated: true)
      })
      .disposed(by: disposeBag)
  }
  
  // MARK: - Actions
  
  @objc func sortButtonTapped() {
    let alertController = UIAlertController(
      title: "Sort By",
      message: nil,
      preferredStyle: .actionSheet)
    
    for sortType in SortType.allCases {
      alertController.addAction(
        UIAlertAction(
          title: sortType.rawValue.capitalized,
          style: .default,
          handler: { [weak self] _ in
            self?.viewModel.selectedSortType(sortType)
          })
      )
    }
    
    alertController.addAction(
      UIAlertAction(
        title: "Cancel",
        style: .cancel,
        handler: nil))
    
    present(alertController, animated: true, completion: nil)
  }
  
  @objc private func filterButtonTapped() {
    let vc = FilterViewController()
    let nc = UINavigationController(rootViewController: vc)
    nc.modalPresentationStyle = .pageSheet
    if let sheet = nc.sheetPresentationController {
        sheet.detents = [.medium()]
    }
    present(nc, animated: true)
  }
  
  @objc private func settingsButtonTapped() {
    let vc = SettingsViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension EmployeesViewController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    heightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    UITableView.automaticDimension
  }
  
  func tableView(
    _ tableView: UITableView,
    estimatedHeightForRowAt indexPath: IndexPath
  ) -> CGFloat {
    return 150.0
  }
}
