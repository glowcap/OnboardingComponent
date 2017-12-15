//
//  OnboardPageControl.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/12.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import RxSwift


/// This class mimics UIPageControl, but includes additional features
/// to which UIPageControl doesn't give you access.
final class OnboardingPageControl: UIView {
  
  /// The size of the indicator dots (or images)
  var pageIndicatorSize: CGFloat!
  
  /// The number of pages shown (as dots or images).
  var numberOfPages: Int!
  
  /// The indicators shown as dots or images
  var pageIndicators = [Component<PageIndicator>]()
  
  /// The index of the
  var currentIndex = Variable<Int>(0)
  
  /// A Boolean value that controls whether the page control is hidden when there is only one page.
  var hidesForSinglePage: Bool! {
    didSet {
      guard hidesForSinglePage else { return }
      hideForSinglePage()
    }
  }
  
  /// The tint color to be used for the page indicator.
  var pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
  
  /// The tint color to be used for the current page indicator.
  var currentpageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  
  /// This initializer must be used to initialize the class with all
  /// the sweet customizations. Don't miss out on all the goodness
  ///
  /// - Parameters:
  ///   - model: The model of how the page indicators should look.
  ///   - numberOfPages: This determines the number of indicators needed.
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
  
  
  /// A function for hidesForSingePage
  private func hideForSinglePage() {
    alpha = numberOfPages <= 1 ? 0 : 1
  }
  
  
  /// Used to update the current indicator
  ///
  /// - Parameter index: The index of the page currently displayed
  func updateCurrentPageDisplay(with index: Int) {
    _ = pageIndicators.map { $0.item.isCurrent.value = false }
    pageIndicators[index].item.isCurrent.value = true
  }

  
  /// Use this to set the size.
  ///
  /// - Returns: The `CGSize` of `OnboardPageControl`
  func setSize() -> CGSize {
    let width = CGFloat(Int(pageIndicatorSize) * (numberOfPages + numberOfPages - 1))
    return CGSize(width: width, height: pageIndicatorSize)
  }

}
