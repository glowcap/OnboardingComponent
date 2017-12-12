//
//  ViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/11.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
  
  let button: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    btn.layer.cornerRadius = 3
    btn.clipsToBounds = true
    btn.setTitleColor(.white, for: .normal)
    btn.setTitle("Tap Me", for: .normal)
    return btn
  }()
  
  var pageViewController: OnboardingPageViewController = {
    let pVC = OnboardingPageViewController(transitionStyle: .scroll,
                                 navigationOrientation: .horizontal,
                                 options: nil)
    return pVC
  }()
  
  let model1 = OnboardingContentModel(image: #imageLiteral(resourceName: "Onboard01"), text: "Onboarding message one")
  let model2 = OnboardingContentModel(image: #imageLiteral(resourceName: "Onboard02"), text: "Onboarding message two")
  let model3 = OnboardingContentModel(image: #imageLiteral(resourceName: "Onboard01"), text: "Onboarding message three")
  
  lazy var pages = [
    OnboardingContentViewController(model: self.model1),
    OnboardingContentViewController(model: self.model2),
    OnboardingContentViewController(model: self.model3)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    pageViewController.dataSource = self
    
    pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    
    setupViews()
  }


  func setupViews() {
    setupButton()
    setupPageViewController()
  }
  
  func setupButton() {
    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.bottom.equalTo(view.snp.bottom).offset(-40)
      make.centerX.equalTo(view.snp.centerX)
      make.width.equalTo(200)
      make.height.equalTo(44)
    }
  }
  
  func setupPageViewController() {
    addChildViewController(pageViewController)
    view.addSubview(pageViewController.view)
    pageViewController.didMove(toParentViewController: self)
    pageViewController.view.snp.makeConstraints { make in
      make.top.equalTo(view.snp.top)
      make.left.equalTo(view.snp.left)
      make.right.equalTo(view.snp.right)
      make.bottom.equalTo(view.snp.bottom).offset(-100)
    }
  }

}

extension OnboardingViewController: UIPageViewControllerDataSource {
  
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
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    // update pagination
  }
  
}

