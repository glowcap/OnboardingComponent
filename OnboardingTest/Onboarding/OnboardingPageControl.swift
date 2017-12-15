//
//  OnboardPageControl.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/12.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import RxSwift

final class OnboardingPageControl: UIView {
  
  var size: CGSize!
  var pageIndicatorSize: CGFloat!
  var numberOfPages: Int!
  var pageIndicators = [Component<PageIndicator>]()
  
  var currentIndex = Variable<Int>(0)
  
  var hidesForSinglePage = true
  var pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
  var currentpageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  var defersCurrentPageDisplay = false
    
  convenience init(model: PageIndicatorModel, numberOfPages: Int) {
    self.init(frame: CGRect.zero)
    self.numberOfPages      = numberOfPages
    self.pageIndicatorSize  = model.size
    
    var indicatorsMade = 0
    repeat {
      let indicator = Indicator(model: model, at: indicatorsMade)
      pageIndicators.append(indicator)
      indicatorsMade += 1
    } while indicatorsMade < numberOfPages
    
    currentIndex.asObservable().subscribe(onNext: { [unowned self] in
      self.updateCurrentPageDisplay(with: $0)
    }).disposed(by: rx.disposeBag)
    
  }
  
  func updateCurrentPageDisplay(with index: Int) {
    _ = pageIndicators.map { $0.item.isCurrent.value = false }
    pageIndicators[index].item.isCurrent.value = true
  }

  func setSize() -> CGSize {
    let width = CGFloat(Int(pageIndicatorSize) * (numberOfPages + numberOfPages - 1))
    return CGSize(width: width, height: pageIndicatorSize)
  }

}
