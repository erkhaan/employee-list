//
//  SettingsViewController.swift
//  employee-list
//
//  Created by Erkhaan  on 12.05.2024.
//

import UIKit
import SnapKit

final class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  // MARK: - Properties
  
  var tableView: UITableView!
  let crashCellIdentifier = "CrashCell"
  let modeCellIdentifier = "ModeCell"
  private let presenter: SettingsPresenter
  
  // MARK: - Init
  
  init() {
    self.presenter = SettingsPresenter()
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - VC lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  // MARK: - Setup UI
  
  private func setupViews() {
    view.backgroundColor = .white
    setupNavigationBar()
    setupTableView()
  }
  
  private func setupTableView() {
    tableView = UITableView(frame: view.bounds, style: .grouped)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: crashCellIdentifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: modeCellIdentifier)
    view.addSubview(tableView)
  }
  
  private func setupNavigationBar() {
    navigationItem.title = "Settings"
  }
  
  // MARK: - UITableViewDataSource Methods
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 1 : 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: crashCellIdentifier, for: indexPath)
      cell.textLabel?.text = "Crash Application"
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: modeCellIdentifier, for: indexPath)
      let modeSwitch = UISwitch()
      modeSwitch.addTarget(
        self,
        action: #selector(modeSwitchValueChanged),
        for: .valueChanged)
      if presenter.themeType == .DARK {
        modeSwitch.isOn = true
      } else {
        modeSwitch.isOn = false
      }
      cell.accessoryView = modeSwitch
      cell.textLabel?.text = "Dark Mode"
      return cell
    }
  }
  
  // MARK: - UITableViewDelegate Methods
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.section == 0 {
      crashButtonTapped()
    }
  }
  // MARK: - Actions
  
  @objc private func modeSwitchValueChanged(sender: UISwitch) {
    // Toggle between light and dark mode based on switch state
  }
  
  private func crashButtonTapped() {
    let numbers = [0]
    let _ = numbers[1]
  }
}
