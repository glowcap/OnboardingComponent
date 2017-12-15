//
//  ViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/11.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

// this can be set anywhere in the project, even pulled from an API call and parsed.
let professionalOnboardingModels = [
  OnboardingContentModel(index: 0, image: #imageLiteral(resourceName: "Onboard1"), text: "Pro Onboarding message one. This message is to welcome the user to the onboarding process. It may take a few lines to do so."),
  OnboardingContentModel(index: 1, image: #imageLiteral(resourceName: "Onboard2"), text: "Pro Onboarding message two. Here is where users find out some of the benefits of the application."),
  OnboardingContentModel(index: 2, image: #imageLiteral(resourceName: "Onboard3"), text: "Pro Onboarding message three. The final screen is some kind of push to get the user started with the application."),
  OnboardingContentModel(index: 3, image: #imageLiteral(resourceName: "Onboard1"), text: "Pro Onboarding message one. This message is to welcome the user to the onboarding process. It may take a few lines to do so."),
  OnboardingContentModel(index: 4, image: #imageLiteral(resourceName: "Onboard2"), text: "Pro Onboarding message two. Here is where users find out some of the benefits of the application."),
  OnboardingContentModel(index: 5, image: #imageLiteral(resourceName: "Onboard3"), text: "Pro Onboarding message three. The final screen is some kind of push to get the user started with the application.")
]

let studentOnboardingModels = [
  OnboardingContentModel(index: 0, image: #imageLiteral(resourceName: "Onboard1"), text: "Student Onboarding message one. This message is to welcome the user to the onboarding process. It may take a few lines to do so."),
  OnboardingContentModel(index: 1, image: #imageLiteral(resourceName: "Onboard2"), text: "Studnet Onboarding message two. Here is where users find out some of the benefits of the application."),
  OnboardingContentModel(index: 2, image: #imageLiteral(resourceName: "Onboard3"), text: "Student Onboarding message three. The final screen is some kind of push to get the user started with the application.")
]

enum UserPath: Equatable {
  case professional
  case student
}

func == (lhs: UserPath, rhs: UserPath) -> Bool {
  switch (lhs, rhs) {
  case (.professional, .professional), (.student, .student):
    return true
  default:
    return false
  }
}

final class OnboardingViewController: OSViewController {
  
  var userPath: UserPath! {
    didSet {
      if userPath == .professional {
        models = professionalOnboardingModels
      } else {
        models = studentOnboardingModels
      }
    }
  }
  
  lazy var backButton   = BackButton()
  lazy var skipButton   = SkipButton()
  lazy var signUpButton = SignUpButton()
  lazy var loginButton  = LoginButton()
  
  var pageControl: Component<OnboardingPageControl>!
  
  var pageViewController: OnboardingPageViewController = {
    let pVC = OnboardingPageViewController(transitionStyle: .scroll,
                                 navigationOrientation: .horizontal,
                                 options: nil)
    return pVC
  }()
  
  var models: [OnboardingContentModel]!
  var dataSource = OnboardingDataSource()
  
  convenience init(models: [OnboardingContentModel]) {
    self.init()
    self.models = models
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    pageViewController.delegate = self
    configurePageViewController()
    setupViews()
    bindingRx()
    
    _ = loginButton
    
    configurePageController()
  }
  
  private func configurePageViewController() {
    let pages = models.flatMap { OnboardingContentViewController(model: $0) }
    dataSource.pages = pages
    pageViewController.dataSource = dataSource
    pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
  }
  
  private func configurePageController() {
    let pCModel = PageIndicatorModel(size: 8, activeColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), inactiveColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), image: #imageLiteral(resourceName: "PageIndicatorIcon"))
    pageControl = PageControl(model: pCModel, pageCount: models.count)
    pageControl.item.currentIndex.value = 0
  }

  private func setupViews() {
    setupPageViewController()
  }
  
  private func setupPageViewController() {
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
    
    backButton.item
    .rx.tap
    .subscribe(onNext: { [unowned self] in
      self.navigationController?.popViewController(animated: true)
    }).disposed(by: rx.disposeBag)
    
    skipButton.item
    .rx.tap
    .subscribe(onNext: { [unowned self] in
      let signUpVC = SignUpViewController()
      self.present(signUpVC, animated: true)
    }).disposed(by: rx.disposeBag)
    
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

extension OnboardingViewController: UIPageViewControllerDelegate {
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    guard let contentVC = pageViewController.viewControllers?.first as? OnboardingContentViewController else { return }
    
    switch (finished, completed) {
      case (true, true):
      self.pageControl.item.currentIndex.value = contentVC.index!
      default:
        break
    }
  }
  
}
