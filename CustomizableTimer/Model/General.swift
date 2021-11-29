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
    case showBackAtShowTime1
    case animationShowTime2
    case showBackAtShowTime2
    case animationShowTime3
    case showBackAtShowTime3
    case animationShowTime4
    case showBackAtShowTime4
    case animationShowTime5
    case showBackAtShowTime5
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
      UserDefaultsKeyGeneral.showBackAtShowTime1.rawValue : false,
      UserDefaultsKeyGeneral.animationShowTime2.rawValue : Date(),
      UserDefaultsKeyGeneral.showBackAtShowTime2.rawValue : false,
      UserDefaultsKeyGeneral.animationShowTime3.rawValue : Date(),
      UserDefaultsKeyGeneral.showBackAtShowTime3.rawValue : false,
      UserDefaultsKeyGeneral.animationShowTime4.rawValue : Date(),
      UserDefaultsKeyGeneral.showBackAtShowTime4.rawValue : false,
      UserDefaultsKeyGeneral.animationShowTime5.rawValue : Date(),
      UserDefaultsKeyGeneral.showBackAtShowTime5.rawValue : false,
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
  var showBackAtShowTime1: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showBackAtShowTime1.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showBackAtShowTime1.rawValue) }
  }
  var animationShowTime2: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime2.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime2.rawValue) }
  }
  var showBackAtShowTime2: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showBackAtShowTime2.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showBackAtShowTime2.rawValue) }
  }
  var animationShowTime3: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime3.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime3.rawValue) }
  }
  var showBackAtShowTime3: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showBackAtShowTime3.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showBackAtShowTime3.rawValue) }
  }
  var animationShowTime4: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime4.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime4.rawValue) }
  }
  var showBackAtShowTime4: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showBackAtShowTime4.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showBackAtShowTime4.rawValue) }
  }
  var animationShowTime5: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyGeneral.animationShowTime5.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.animationShowTime5.rawValue) }
  }
  var showBackAtShowTime5: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyGeneral.showBackAtShowTime5.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyGeneral.showBackAtShowTime5.rawValue) }
  }
}

extension General {
  /// 前面または背面に設定された指定時刻のうち、現在時刻に最も近い`Date`を返却
  /// - Parameter showBack: 前面(false)または背面(true)
  func getLatestShowTime(_ showBack: Bool) -> Date? {
    let boolArray: [Bool] = [
      self.showBackAtShowTime1 == showBack ? true : false,
      self.showBackAtShowTime2 == showBack ? true : false,
      self.showBackAtShowTime3 == showBack ? true : false,
      self.showBackAtShowTime4 == showBack ? true : false,
      self.showBackAtShowTime5 == showBack ? true : false,
    ]
    var dateArray: [Date] = [
      self.animationShowTime1,
      self.animationShowTime2,
      self.animationShowTime3,
      self.animationShowTime4,
      self.animationShowTime5,
    ]
    
    // showBackと等価でないDateを除外
    let lastIndex: Int = boolArray.count - 1
    for i in 0...lastIndex {
      if boolArray[lastIndex - i] == false {
        dateArray.remove(at: lastIndex - i)
      }
    }
    // 現在時刻に満たないDateを除外+昇順ソート
    let currentDate = Date()
    dateArray = dateArray.filter{ $0 > currentDate }.sorted()
    
    // 要素数が0の場合はnilを返却
    if dateArray.count == 0 {
      return nil
    }
    
    return dateArray.first
  }
}
