//
//  ViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/11.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import SnapKit

final class OnboardingViewController: OSViewController {
  
  lazy var signUpButton = SignUpButton()
  lazy var loginButton  = LoginButton()
  
  var pageViewController: OnboardingPageViewController = {
    let pVC = OnboardingPageViewController(transitionStyle: .scroll,
                                 navigationOrientation: .horizontal,
                                 options: nil)
    return pVC
  }()
  
  lazy var pageControl = OnboardingPageControl()
  
  var models: [OnboardingContentModel]!
  var dataSource = OnboardingDataSource()
  
  convenience init(models: [OnboardingContentModel]) {
    self.init()
    self.models = models
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    let pages = models.flatMap { OnboardingContentViewController(model: $0) }
    dataSource.pages = pages
    pageViewController.dataSource = dataSource
    pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
    setupViews()
    
    bindingRx()
    _ = loginButton
  }
  
//  func OnboardingPageControl() -> Component<OnboardingPageControl> {
//    return Component<OnboardingPageControl>()
//      .initialize {
//
//    }
//  }

  func setupViews() {
    setupPageViewController()
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
  
  override func bindingRx() {
    super.bindingRx()
    
    signUpButton.item
    .rx.tap
    .subscribe(onNext: { [unowned self] in
      let signUpVC = SignUpViewController()
      self.present(signUpVC, animated: true)
    }).disposed(by: rx.disposeBag)
    
    loginButton.item
    .rx.tap
    .subscribe(onNext: { [unowned self] in
      let logInVC = LogInViewController()
      self.present(logInVC, animated: true)
    }).disposed(by: rx.disposeBag)
  }

}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    // update pagination
    print("Did Finish Animating")
  }
  
}

