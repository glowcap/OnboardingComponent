//
//  OnboardingViewController+Helper.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/13.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

extension OnboardingViewController {
  
  func BackButton() -> Component<UIButton> {
    return Component<UIButton>()
    .attach(to: self.view)
      .configure { btn in
        btn.setTitle("back", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    .layout { [unowned self] btn in
      btn.snp.makeConstraints { make in
        make.top.equalTo(self.view.snp.top).offset(20)
        make.left.equalTo(self.view.snp.left).offset(6)
      }
    }
  }
  
  func SkipButton() -> Component<UIButton> {
    return Component<UIButton>()
      .attach(to: self.view)
      .configure { btn in
        btn.setTitle("skip", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
      }
      .layout { [unowned self] btn in
        btn.snp.makeConstraints { make in
          make.centerY.equalTo(self.backButton.item.snp.centerY)
          make.right.equalTo(self.view.snp.right).offset(-6)
        }
      }
  }
  
  func PageControl(model: PageIndicatorModel, pageCount: Int) -> Component<OnboardingPageControl> {
    return Component<OnboardingPageControl>()
      .initialize {
        OnboardingPageControl(model: model, numberOfPages: pageCount)
      }
      .attach(to: self.view)
      .configure { _ in }
      .layout { [unowned self] oPC in
        oPC.snp.makeConstraints { make in
          let size = oPC.setSize()
          make.centerX.equalTo(self.view.snp.centerX)
          make.bottom.equalTo(self.signUpButton.item.snp.top).offset(-30)
          make.width.equalTo(size.width)
          make.height.equalTo(size.height)
        }
      }
  }
  
  func SignUpButton() -> Component<UIButton> {
    return Component<UIButton>()
      .attach(to: self.view)
      .configure { btn in
        btn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        btn.layer.cornerRadius = 3
        btn.clipsToBounds = true
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Sign up", for: .normal)
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
