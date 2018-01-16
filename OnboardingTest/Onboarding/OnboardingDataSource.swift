//
//  OnboardingDataSource.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/13.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

class OnboardingDataSource: NSObject, UIPageViewControllerDataSource {
  
  var pages: [OnboardingContentViewController]!
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let index = pages.index(of: viewController as! OnboardingContentViewController),
      index > 0
      else { return nil }
    return pages[index - 1]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let index = pages.index(of: viewController as! OnboardingContentViewController),
      index < pages.count - 1
      else { return nil }
    return pages[index + 1]
  }
  
}
