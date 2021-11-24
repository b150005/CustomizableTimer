//
//  Digital.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/21.
//

import Foundation
import Cocoa

class Digital {
  enum UserDefaultsKeyDigital: String {
    // MARK: - 全般
    case isTimer
    // MARK: - フォント
    case fontName
    case fontColorBase
    case fontColorBefore
    case beforeSec
    case fontColorAfter
    case afterSec
    case opacity
    // MARK: - タイマー
    case timerDate
    case switchToClock
  }
  
  private let userDefaults = UserDefaults.standard
  
  // シングルトンなDigitalインスタンス
  static let shared: Digital = Digital()
  private init() {
    userDefaults.register(defaults: [
      // MARK: - 全般
      UserDefaultsKeyDigital.isTimer.rawValue : false,
      // MARK: - フォント
      UserDefaultsKeyDigital.fontName.rawValue : NSFont.systemFont(ofSize: 13.0).fontName,
      UserDefaultsKeyDigital.fontColorBase.rawValue : NSColor.blue,
      UserDefaultsKeyDigital.fontColorBefore.rawValue : NSColor.red,
      UserDefaultsKeyDigital.beforeSec.rawValue : 300,
      UserDefaultsKeyDigital.fontColorAfter.rawValue : NSColor.green,
      UserDefaultsKeyDigital.afterSec.rawValue : 300,
      UserDefaultsKeyDigital.opacity.rawValue : 1.0,
      // MARK: - タイマー
      UserDefaultsKeyDigital.timerDate.rawValue : Date(),
      UserDefaultsKeyDigital.switchToClock.rawValue : false,
    ])
  }
  
  var isTimer: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyDigital.isTimer.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.isTimer.rawValue) }
  }
  var fontName: String {
    get { return userDefaults.string(forKey: UserDefaultsKeyDigital.fontName.rawValue)! }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.fontName.rawValue) }
  }
  var fontColorBase: NSColor {
    get { return userDefaults.color(forKey: UserDefaultsKeyDigital.fontColorBase.rawValue) }
    set { userDefaults.setColor(newValue, forKey: UserDefaultsKeyDigital.fontColorBase.rawValue) }
  }
  var fontColorBefore: NSColor {
    get { return userDefaults.color(forKey: UserDefaultsKeyDigital.fontColorBefore.rawValue) }
    set { userDefaults.setColor(newValue, forKey: UserDefaultsKeyDigital.fontColorBefore.rawValue) }
  }
  var beforeSec: Int {
    get { return userDefaults.integer(forKey: UserDefaultsKeyDigital.beforeSec.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.beforeSec.rawValue) }
  }
  var fontColorAfter: NSColor {
    get { return userDefaults.color(forKey: UserDefaultsKeyDigital.fontColorAfter.rawValue) }
    set { userDefaults.setColor(newValue, forKey: UserDefaultsKeyDigital.fontColorAfter.rawValue) }
  }
  var afterSec: Int {
    get { return userDefaults.integer(forKey: UserDefaultsKeyDigital.afterSec.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.afterSec.rawValue) }
  }
  var opacity: Float {
    get { return userDefaults.float(forKey: UserDefaultsKeyDigital.opacity.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.opacity.rawValue) }
  }
  var timerDate: Date {
    get { return userDefaults.date(forKey: UserDefaultsKeyDigital.timerDate.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.timerDate.rawValue) }
  }
  var switchToClock: Bool {
    get { return userDefaults.bool(forKey: UserDefaultsKeyDigital.switchToClock.rawValue) }
    set { userDefaults.set(newValue, forKey: UserDefaultsKeyDigital.switchToClock.rawValue) }
  }
}

extension UserDefaults {
  /// UserDefaultsに保存された`NSColor`データを取得
  func color(forKey key: String) -> NSColor {
    // Dataオブジェクトとして取得
    guard let colorData: Data = UserDefaults.standard.data(forKey: key) else { return NSColor.black }
    // Data → NSColor への変換
    guard let color: NSColor = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: colorData) else { return NSColor.black }
    return color
  }
  
  /// `NSColor`オブジェクトを`Data`型に変換してUserDefaultsに保存
  func setColor(_ value: NSColor, forKey key: String) {
    guard let colorData: Data = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false) else { return }
    UserDefaults.standard.set(colorData, forKey: key)
  }
}
