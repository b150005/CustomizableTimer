//
//  UserDefaults+AnimationTiming.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/29.
//

import Foundation

enum AnimationTiming: String {
  case always = "常時"
  case specified = "指定時"
}

extension UserDefaults {
  /// `Date`オブジェクトをUserDefaultsから取得
  func date(forKey key: String) -> Date {
    let value = UserDefaults.standard.object(forKey: key)
    guard let date = value as? Date else { return Date() }
    return date
  }
  
  /// `Enum`オブジェクトをUserDefaultsから取得
  /// 実際に格納されているのはEnum.rawValue
  func animationTiming(forKey key: String) -> AnimationTiming {
    guard let rawValue = UserDefaults.standard.object(forKey: key) as? String else {
      return AnimationTiming.always
    }
    guard let animationTiming = AnimationTiming(rawValue: rawValue) else {
      return AnimationTiming.always
    }
    return animationTiming
  }
}
