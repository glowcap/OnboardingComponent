//
//  Component.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/12.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

protocol ComponentType {
  associatedtype T
  func initialize(_ block: () -> T) -> Self
  func attach(to view: UIView) -> Self
  func configure(_ block: (T) -> Void) -> Self
  func layout(_ block: @escaping (T) -> Void) -> Self
}

class Component<Type: UIView>: ComponentType {
  
  typealias T = Type
  var item = T()
  
  private var isAttached = false
  
  func initialize(_ block: () -> Type) -> Self {
    item = block()
    return self
  }
  
  func attach(to view: UIView) -> Self {
    view.addSubview(item)
    isAttached = true
    return self
  }
  
  func configure(_ block: (Type) -> Void) -> Self {
    block(item)
    return self
  }
  
  func layout(_ block: @escaping (Type) -> Void) -> Self {
    if !isAttached {
      fatalError("Please call attach(to: _) method before calling layout")
    }
    block(item)
    return self
  }
  
}
