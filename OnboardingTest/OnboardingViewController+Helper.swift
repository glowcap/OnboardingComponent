//
//  OnboardingViewController+Helper.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/13.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

extension OnboardingViewController {
  
  func SignUpButton() -> Component<UIButton> {
    return Component<UIButton>()
      .attach(to: self.view)
      .configure { btn in
        btn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        btn.layer.cornerRadius = 3
        btn.clipsToBounds = true
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Tap Me", for: .normal)
      }
      .layout { [unowned self] btn in
        btn.snp.makeConstraints { make in
          make.bottom.equalTo(self.view.snp.bottom).offset(-40)
          make.centerX.equalTo(self.view.snp.centerX)
          make.width.equalTo(200)
          make.height.equalTo(44)
        }
    }
  }
  
  func LoginButton() -> Component<UIButton> {
    return Component<UIButton>()
      .attach(to: self.view)
      .configure { btn in
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitle("Log in", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        btn.backgroundColor = .clear
      }
      .layout { [unowned self] btn in
        btn.snp.makeConstraints { make in
          make.centerX.equalTo(self.view.snp.centerX)
          make.bottom.equalTo(self.view.snp.bottom).offset(-6)
        }
    }
  }
  
}
