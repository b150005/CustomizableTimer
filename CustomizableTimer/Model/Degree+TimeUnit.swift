//
//  Degree+TimeUnit.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/25.
//

import Foundation

/// アナログ時計の針(長針・短針・秒針)の初期角度を保持する構造体
struct Degree {
  var hDeg: Double = 0
  var mDeg: Double = 0
  var sDeg: Double = 0
  let date: Date = Date()
  
  init() {
    hDeg = self.getDegrees(.Hour, date)
    mDeg = self.getDegrees(.Minute, date)
    sDeg = self.getDegrees(.Second, date)
  }
  
  /// 現在時刻に基づく各時針の回転角度の取得
  /// - Parameter unit: 列挙型`TimeUnit`
  private func getDegrees(_ unit: TimeUnit, _ date: Date) -> Double {
    let calendar = Calendar.current
    
    let hour24 = calendar.component(.hour, from: date)
    let hour12: Double = (hour24 >= 12) ? Double(hour24 - 12) : Double(hour24)
    let minute: Double = Double(calendar.component(.minute, from: date))
    let second: Double = Double(calendar.component(.second, from: date))
    
    switch unit {
    case .Hour:
      return (hour12 / 12 * 360) + (minute / 60 * 30) + (second / 60 / 2)
    case .Minute:
      return (minute / 60 * 360) + (second / 60 * 6)
    case .Second:
      return second / 60 * 360
    }
  }
}

/// 時・分・秒を表す列挙型
/// → 各ケースは時計の針が1周するのにかかる時間[秒]を保持する
enum TimeUnit: Double {
  case Hour = 43200
  case Minute = 3600
  case Second = 60
}
