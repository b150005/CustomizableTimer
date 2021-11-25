//
//  AnalogPreviewController.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/24.
//

import Cocoa
import SwiftyGif

class AnalogPreviewController: NSViewController {
  // ImageView
  @IBOutlet weak var faceImageView: NSImageView!
  @IBOutlet weak var hourImageView: NSImageView!
  @IBOutlet weak var minuteImageView: NSImageView!
  @IBOutlet weak var secondImageView: NSImageView!
  @IBOutlet weak var animation1ImageView: NSImageView!
  @IBOutlet weak var animation2ImageView: NSImageView!
  
  let general: General = General.shared
  let analog: Analog = Analog.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // プレビューの描画
    self.reloadAnalogPreview()
  }
}

extension AnalogPreviewController {
  /// プレビューの描画
  func reloadAnalogPreview() {
    // アナログ時計
    self.reloadClock()
    // アニメーション
    self.reloadAnimation()
  }
  
  // MARK: - アナログ時計
  /// アナログ時計の描画
  private func reloadClock() {
    // 画像ファイル
    self.reloadClockImage()
    // アニメーション
  }
  
  /// アナログ時計の画像ファイル(時計盤・短針・長針・秒針)の読込(針は回転した状態で描画)
  private func reloadClockImage() {
    var image: NSImage
    let degree = Degree()
    print(degree.hDeg, degree.mDeg, degree.sDeg)
    
    if let faceUrl = analog.faceFilePath {
      self.faceImageView.image = NSImage(byReferencing: faceUrl)
    }
    if let hourUrl = analog.hourFilePath {
      image = NSImage(byReferencing: hourUrl)
      self.hourImageView.image = image.rotated(by: degree.hDeg)
    }
    if let minuteUrl = analog.minuteFilePath {
      image = NSImage(byReferencing: minuteUrl)
      self.minuteImageView.image = image.rotated(by: degree.mDeg)
    }
    if let secondUrl = analog.secondFilePath {
      image = NSImage(byReferencing: secondUrl)
      self.secondImageView.image = image.rotated(by: degree.sDeg)
    }
  }
  
  // MARK: - アニメーション
  /// アニメーションの描画
  private func reloadAnimation() {
    
  }
  
  /// AnimationTimingをもとにGIFアニメーションのループ回数を設定
  /// - Parameter timing: `AnimationTiming`
  private func getLoopCount(_ timing: AnimationTiming) -> Int {
    switch timing {
    case .always: return -1
    case .designated: return 1
    }
  }
}
