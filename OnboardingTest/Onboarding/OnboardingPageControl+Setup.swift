//
//  OnboardingPageControl+Setup.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/14.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

extension OnboardingPageControl {
  
  
  /// Indicator creates an indicator icon for OnboardingPageControl.
  /// The `index` paramater is key for spacing the icons correctly.
  ///
  /// - Parameters:
  ///   - model: The model used for this indicator
  ///   - index: The index of this indicator
  /// - Returns: `Component<PageIndicator>`
  func Indicator(model: PageIndicatorModel, at index: Int) -> Component<PageIndicator> {
    return Component<PageIndicator>()
      .initialize {
        PageIndicator(model: model)
      }
      .attach(to: self)
      .configure { _ in }
      .layout { [unowned self] indicator in
        indicator.snp.makeConstraints { make in
          make.centerY.equalTo(self.snp.centerY)
          make.width.equalTo(model.size)
          make.height.equalTo(model.size)
          
          if index > 0 {
            let xPos = model.size * CGFloat(index * 2)
            make.left.equalTo(self.snp.left).offset(xPos)
          } else {
            make.left.equalTo(self.snp.left)
          }
        }
    }
  }
  
}
