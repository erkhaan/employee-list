//
//  SettingsViewController.swift
//  employee-list
//
//  Created by Erkhaan  on 12.05.2024.
//

import UIKit

final class SettingsViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let button = UIButton(type: .roundedRect)
    button.frame = CGRect(x: 100, y: 50, width: 100, height: 30)
    button.setTitle("Test Crash", for: [])
    button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
    view.addSubview(button)
  }
  
  @objc func threeDotsButtonTapped() {
    let viewControllerToOpen = SettingsViewController()
    navigationController?.pushViewController(viewControllerToOpen, animated: true)
  }
  
  @IBAction func crashButtonTapped(_ sender: AnyObject) {
      let numbers = [0]
      let _ = numbers[1]
  }
}
