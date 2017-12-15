//
//  OSViewController.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/12.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import SnapKit

class OSViewController: UIViewController {
  
  #if TRACE_RESOURCES
  #if !RX_NO_MODULE
  private let startResourceCount = RxSwift.Resources.total
  #else
  private let startResourceCount = Resources.total
  #endif
  #endif
  
  override func viewDidLoad() {
    super.viewDidLoad()
    #if TRACE_RESOURCES
      print("Number of start resources = \(Resources.total)")
    #endif
  }
  
  deinit {
    #if TRACE_RESOURCES
      print("\(type(of: self)) disposed with \(Resources.total) resources")
      let numberOfResourcesThatShouldRemain = startResourceCount
      let mainQueue = DispatchQueue.main
      let when = DispatchTime.now() + DispatchTimeInterval.milliseconds(OSApplication.isInUITest ? 1_000 : 100)
      mainQueue.asyncAfter (deadline: when) {
        assert(Resources.total <= numberOfResourcesThatShouldRemain, "Resources weren't cleaned properly, \(Resources.total) remained, \(numberOfResourcesThatShouldRemain) expected")
        
      }
    #endif
  }
  
  func bindingRx() { }
  
}

extension OSViewController {
  
  func showAlert(_ title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
      
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
}
