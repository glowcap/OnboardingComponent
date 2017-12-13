//
//  OnboardPageControl.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/12.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

final class OnboardingPageControl: UIView {
  
  var  pageIndicatorImage: UIImage?
  
  var  pageIndicatorSize: CGSize!
  
  var currentPage = 0
  
  var numberOfPages: Int!
  
  var hidesForSinglePage = true
  
  var pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
  
  var currentpageIndicatorTintColor =
    #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
  var defersCurrentPageDisplay = false
  
//  convenience init(numberOfPages: Int, pageIndicatorSize: CGSize, pageIndicatorImage: UIImage? = nil) {
//    self.init(frame: <#T##CGRect#>)
//    
//    self.numberOfPages      = numberOfPages
//    self.pageIndicatorSize  = pageIndicatorSize
//    self.pageIndicatorImage = pageIndicatorImage
//  }
  

  override init(frame: CGRect) {
    super.init(frame: frame)
//    super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: pageIndicatorSize.width * numberOfPages, height: pageIndicatorSize.height))
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func updateCurrentPageDisplay() {
  
  }
  
  
  func size(forNumberOfPages: Int) -> CGSize {
    return CGSize.zero
  }


}
