//
//  PageIndicator.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/14.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import RxSwift

struct PageIndicatorModel {
  
  var size: CGFloat
  var activeColor: UIColor
  var inactiveColor: UIColor
  var image: UIImage?
  
  init(size: CGFloat, activeColor: UIColor? = nil, inactiveColor: UIColor? = nil, image: UIImage? = nil) {
    self.size           = size
    self.activeColor    = activeColor ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    self.inactiveColor  = inactiveColor ?? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    self.image          = image
  }
  
}

final class PageIndicator: UIImageView {
  
  private var model: PageIndicatorModel!
  var isCurrent = Variable<Bool>(false)
  
  convenience init(model: PageIndicatorModel) {
    let frame = CGRect(x: 0, y: 0, width: model.size, height: model.size)
    self.init(frame: frame)
    self.model = model
    
    if let img = model.image {
      self.image = img.withRenderingMode(.alwaysTemplate)
    } else {
      self.layer.cornerRadius = model.size / 2
      self.clipsToBounds = true
    }
    
    self.contentMode = .scaleAspectFit
    
    isCurrent.asObservable()
      .subscribe(onNext: { [unowned self] isCur in
        let color = isCur ? model.activeColor : model.inactiveColor
        if model.image != nil {
          self.tintColor = color
        } else {
          self.backgroundColor = color
        }
      }).disposed(by: rx.disposeBag)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}
