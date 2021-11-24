//
//  Analog.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/20.
//

import Foundation

class Analog {
  enum UserDefaultsKeyAnalog: String {
    case faceFilePath
    case hourFilePath
    case minuteFilePath
    case secondFilePath
  }
  
  private let userDefaults = UserDefaults.standard
  
  // シングルトンなAnalogインスタンス
  static let shared: Analog = Analog()
  private init() {}
  
  var faceFilePath: URL? {
    get { return userDefaults.url(forKey: UserDefaultsKeyAnalog.faceFilePath.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyAnalog.faceFilePath.rawValue) }
  }
  var hourFilePath: URL? {
    get { return userDefaults.url(forKey: UserDefaultsKeyAnalog.hourFilePath.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyAnalog.hourFilePath.rawValue) }
  }
  var minuteFilePath: URL? {
    get { return userDefaults.url(forKey: UserDefaultsKeyAnalog.minuteFilePath.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyAnalog.minuteFilePath.rawValue) }
  }
  var secondFilePath: URL? {
    get { return userDefaults.url(forKey: UserDefaultsKeyAnalog.secondFilePath.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyAnalog.secondFilePath.rawValue) }
  }
}
