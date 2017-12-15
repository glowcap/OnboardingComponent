//
//  OnboardingContentViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/11.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import RxSwift

struct OnboardingContentModel {
  let index: Int
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
    lbl.font = UIFont.systemFont(ofSize: 16)
    lbl.numberOfLines = 0
    return lbl
  }()
  
  var index: Int!
  
  convenience init(model: OnboardingContentModel) {
    self.init()
    index        = model.index
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
      make.top.equalTo(self.view.snp.top).offset(60)
      make.left.equalTo(self.view.snp.left).offset(40)
      make.bottom.equalTo(self.view.snp.centerY).offset(40)
      make.right.equalTo(self.view.snp.right).offset(-40)
    }
  }
  
  private func setupMessage() {
    view.addSubview(message)
    message.snp.makeConstraints { make in
      make.top.equalTo(image.snp.bottom).offset(100)
      make.left.equalTo(image.snp.left)
      make.right.equalTo(image.snp.right)
    }
  }
  
}
