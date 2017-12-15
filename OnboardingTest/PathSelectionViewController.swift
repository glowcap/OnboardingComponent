//
//  PathSelectionViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/13.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

class PathSelectionViewController: OSViewController {
  
  lazy var logoLabel = LogoLabel()
  lazy var proPathButton = ProPathButton()
  lazy var studentPathButton = StudentPathButton()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    _ = logoLabel
    bindingRx()
  }
  
  override func bindingRx() {
    proPathButton.item
      .rx.tap
      .subscribe(onNext: { [unowned self] in
        let onboardVC = OnboardingViewController()
        onboardVC.userPath = .professional
        self.navigationController?.show(onboardVC, sender: self)
      }).disposed(by: rx.disposeBag)
    
    studentPathButton.item
      .rx.tap
      .subscribe(onNext: { [unowned self] in
        let onboardVC = OnboardingViewController()
        onboardVC.userPath = .student
        self.navigationController?.show(onboardVC, sender: self)
      }).disposed(by: rx.disposeBag)
  }
  
  func LogoLabel() -> Component<UILabel> {
    return Component<UILabel>()
    .attach(to: self.view)
    .configure { lbl in
      lbl.font = UIFont.systemFont(ofSize: 38, weight: .heavy)
      lbl.textAlignment = .center
      lbl.text = "Onboarding"
    }
    .layout { [unowned self] lbl in
      lbl.snp.makeConstraints { make in
        make.centerY.equalTo(self.view.snp.centerY).offset(-100)
        make.centerX.equalTo(self.view.snp.centerX)
      }
    }
  }
  
  func ProPathButton() -> Component<UIButton> {
    return Component<UIButton>()
    .attach(to: self.view)
    .configure { btn in
      btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
      btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
      btn.setTitle("Professional", for: .normal)
      btn.layer.cornerRadius = 3
      btn.clipsToBounds = true
    }
      .layout { [unowned self] btn in
        btn.snp.makeConstraints { make in
          make.centerY.equalTo(self.view.snp.centerY).offset(-30)
          make.centerX.equalTo(self.view.snp.centerX)
          make.width.equalTo(200)
          make.height.equalTo(44)
        }
    }
  }
  
  func StudentPathButton() -> Component<UIButton> {
    return Component<UIButton>()
      .attach(to: self.view)
      .configure { btn in
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.1206263229, blue: 0.09368226677, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.setTitle("Student", for: .normal)
        btn.layer.cornerRadius = 3
        btn.clipsToBounds = true
      }
      .layout { [unowned self] btn in
        btn.snp.makeConstraints { make in
          make.centerY.equalTo(self.view.snp.centerY).offset(30)
          make.centerX.equalTo(self.view.snp.centerX)
          make.width.equalTo(200)
          make.height.equalTo(44)
        }
    }
  }

}
