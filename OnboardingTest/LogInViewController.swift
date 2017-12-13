//
//  LogInViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/13.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

  let dismissButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("X", for: .normal)
    return btn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    
    /// temp dismiss button for testing
    view.addSubview(dismissButton)
    dismissButton.snp.makeConstraints { [unowned self] make in
      make.top.equalTo(self.view.snp.top).offset(40)
      make.right.equalTo(self.view.snp.right).offset(-20)
    }
    
    dismissButton.rx.tap
      .subscribe(onNext: { [unowned self] in
        self.dismiss(animated: true)
      }).disposed(by: rx.disposeBag)
    /// temp dismiss button end
  }

}
