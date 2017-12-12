//
//  OnboardingContentViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/11.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

struct OnboardingContentModel {
  let image: UIImage
  let text: String
}

final class OnboardingContentViewController: UIViewController {
  
  private let image: UIImageView = {
    let iV = UIImageView()
    iV.contentMode = .scaleAspectFit
    return iV
  }()

  private let message: UILabel = {
    let lbl = UILabel()
    return lbl
  }()
  
  convenience init(model: OnboardingContentModel) {
    self.init()
    image.image  = model.image
    message.text = model.text
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    setupViews()
  }
  
  private func setupViews() {
    setupImage()
    setupMessage()
  }
  
}

extension OnboardingContentViewController {
  
  private func setupImage() {
    view.addSubview(image)
    image.snp.makeConstraints { make in
      make.centerX.equalTo(self.view.snp.centerX)
      make.centerY.equalTo(self.view.snp.centerY).offset(-100)
      make.width.equalTo(200)
      make.height.equalTo(200)
    }
  }
  
  private func setupMessage() {
    view.addSubview(message)
    message.snp.makeConstraints { make in
      make.bottom.equalTo(self.view.snp.bottom).offset(-88)
      make.centerX.equalTo(view.snp.centerX)
    }
  }
  
}
