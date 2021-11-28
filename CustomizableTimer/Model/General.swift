//
//  General.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/20.
//

import Foundation

class General {
  // UserDefaultsのキー
  enum UserDefaultsKeyGeneral: String {
    // MARK: - 全般
    case isDigital
    case showAnimationInFront
    // MARK: - アニメーション(前面)
    case frontAnimationTiming
    case showFrontAnimation
    case frontAnimationFilePath
    // MARK: - アニメーション(背面)
    case backAnimationTiming
    case showBackAnimation
    case backAnimationFilePath
    // MARK: - アニメーション表示時刻
    case animationShowTime1
    case animationShowTime2
    case animationShowTime3
    case animationShowTime4
    case animationShowTime5
  }

  private let userDefaults = UserDefaults.standard
  
  // シングルトンなGeneralインスタンス
  static let shared: General = General()
  private init() {
    // UserDefaultsへの登録
    userDefaults.register(defaults: [
      // MARK: - 全般
      UserDefaultsKeyGeneral.isDigital.rawValue : false,
      UserDefaultsKeyGeneral.showAnimationInFront.rawValue : false,
      // MARK: - アニメーション(前面)
      UserDefaultsKeyGeneral.frontAnimationTiming.rawValue : AnimationTiming.always.rawValue,
      UserDefaultsKeyGeneral.showFrontAnimation.rawValue : false,
      // MARK: - アニメーション(背面)
      UserDefaultsKeyGeneral.backAnimationTiming.rawValue : AnimationTiming.always.rawValue,
      UserDefaultsKeyGeneral.showBackAnimation.rawValue : false,
      // MARK: - アニメーション表示時刻
      UserDefaultsKeyGeneral.animationShowTime1.rawValue : Date(),
      UserDefaultsKeyGeneral.animationShowTime2.rawValue : Date(),
      UserDefaultsKeyGeneral.animationShowTime3.rawValue : Date(),
      UserDefaultsKeyGeneral.animationShowTime4.rawValue : Date(),
      UserDefaultsKeyGeneral.animationShowTime5.rawValue : Date(),
    ])
  }
  
  // MARK: - 全般
  var isDigital: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.isDigital.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.isDigital.rawValue) }
  }
  var showAnimationInFront: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showAnimationInFront.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showAnimationInFront.rawValue) }
  }
  // MARK: - アニメーション(前面)
  var frontAnimationTiming: AnimationTiming {
    get { return userDefaults.animationTiming(forKey: UserDefaultsKeyGeneral.frontAnimationTiming.rawValue) }
    set { userDefaults.set(newValue.rawValue, forKey: UserDefaultsKeyGeneral.frontAnimationTiming.rawValue) }
  }
  var showFrontAnimation: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showFrontAnimation.rawValue) }
    set { return userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showFrontAnimation.rawValue) }
  }
  var frontAnimationFilePath: URL? {
    get { return userDefaults.url(forKey: UserDefaultsKeyGeneral.frontAnimationFilePath.rawValue) }
    set { return userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.frontAnimationFilePath.rawValue) }
  }
  // MARK: - アニメーション(背面)
  var backAnimationTiming: AnimationTiming {
    get { return userDefaults.animationTiming(forKey: UserDefaultsKeyGeneral.backAnimationTiming.rawValue) }
    set { userDefaults.set(newValue.rawValue, forKey: UserDefaultsKeyGeneral.backAnimationTiming.rawValue) }
  }
  var showBackAnimation: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showBackAnimation.rawValue) }
    set { return userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showBackAnimation.rawValue) }
  }
  var backAnimationFilePath: URL? {
    get { return userDefaults.url(forKey: UserDefaultsKeyGeneral.backAnimationFilePath.rawValue) }
    set { return userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.backAnimationFilePath.rawValue) }
  }
  // MARK: - アニメーション表示時刻
  var animationShowTime1: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime1.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime1.rawValue) }
  }
  var animationShowTime2: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime2.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime2.rawValue) }
  }
  var animationShowTime3: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime3.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime3.rawValue) }
  }
  var animationShowTime4: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime4.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime4.rawValue) }
  }
  var animationShowTime5: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime5.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime5.rawValue) }
  }
}

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
