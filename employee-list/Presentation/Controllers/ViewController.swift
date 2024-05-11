//
//  ViewController.swift
//  employee-list
//
//  Created by Erkhaan  on 11.05.2024.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let settingsButton = UIBarButtonItem(
      image: UIImage(systemName: "gear"), 
      style: .plain,
      target: self,
      action: #selector(settingsButtonTapped))
    navigationItem.rightBarButtonItem = settingsButton
  }
  
  @objc func settingsButtonTapped() {
    let viewControllerToOpen = SettingsViewController()
    navigationController?.pushViewController(viewControllerToOpen, animated: true)
  }
}
