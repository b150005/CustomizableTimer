//
//  AnalogPreviewController.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/24.
//

import Cocoa
import SwiftyGif

class AnalogPreviewController: NSViewController, SwiftyGifDelegate {
  // ImageView
  @IBOutlet weak var faceImageView: NSImageView!
  @IBOutlet weak var hourImageView: NSImageView!
  @IBOutlet weak var minuteImageView: NSImageView!
  @IBOutlet weak var secondImageView: NSImageView!
  @IBOutlet weak var frontAnimationImageView: NSImageView!
  @IBOutlet weak var backAnimationImageView: NSImageView!
  
  let general: General = General.shared
  let analog: Analog = Analog.shared
  
  var timer: Timer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.frontAnimationImageView.delegate = self
    self.backAnimationImageView.delegate = self
    }
  
  override func viewDidAppear() {
    // アニメーションのレイヤー階層の変更
    self.setAnimationLayer()
    // アナログ時計プレビューの読込
    self.reloadAnalogPreview()
  }
  
  override func viewWillDisappear() {
    self.stopTimer()
  }
  
  /// Timerオブジェクトの解放
  private func stopTimer() {
    if let timer = self.timer {
      timer.invalidate()
      self.timer = nil
    }
  }
  
  /// アニメーションのレイヤー階層の変更
  private func setAnimationLayer() {
    if self.general.showAnimationInFront == true {
      self.backAnimationImageView.layer?.zPosition = 1
      self.frontAnimationImageView.layer?.zPosition = 1
    }
    else {
      self.backAnimationImageView.layer?.zPosition = 0
      self.frontAnimationImageView.layer?.zPosition = 0
    }
  }
}

extension AnalogPreviewController {
  /// アナログ時計のプレビューの描画
  func reloadAnalogPreview() {
    // アナログ時計
    self.reloadClock()
    // アニメーション
    self.reloadAnimation()
  }
  
  // MARK: - アナログ時計
  /// アナログ時計の描画
  private func reloadClock() {
    // 画像ファイルの読込
    self.reloadClockImage()
    // 回転アニメーションの開始
    self.startClockAnimation()
  }
  
  /// アナログ時計の画像ファイル(時計盤・短針・長針・秒針)の読込
  /// → 針は回転した状態で描画
  private func reloadClockImage() {
    var image: NSImage
    let degree = Degree()
    
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
  
  /// アナログ時計の回転アニメーションの開始
  private func startClockAnimation() {
    self.hourImageView.spinClockwise(TimeUnit.Hour.rawValue)
    self.minuteImageView.spinClockwise(TimeUnit.Minute.rawValue)
    self.secondImageView.spinClockwise(TimeUnit.Second.rawValue)
  }
  
  // MARK: - アニメーション
  /// アニメーションの描画
  private func reloadAnimation() {
    if self.general.showFrontAnimation == true {
      if let url = self.general.frontAnimationFilePath {
        switch self.general.frontAnimationTiming {
        case .always:
          self.frontAnimationImageView.setGifFromURL(url)
        case .specified:
          print("")
        }
      }
    }
    else {
      // ImageViewの初期化
      self.frontAnimationImageView.clear()
    }
    if self.general.showBackAnimation == true {
      if let url = self.general.backAnimationFilePath {
        switch self.general.backAnimationTiming {
        case .always:
          self.backAnimationImageView.setGifFromURL(url)
        case .specified:
          print("")
        }
      }
    }
    else {
      // ImageViewの初期化
      self.backAnimationImageView.clear()
    }
  }
  
  private func showAnimationAtSpecifiedTime() {
    
  }
  
  /// AnimationTimingをもとにGIFアニメーションのループ回数を設定
  /// - Parameter timing: `AnimationTiming`
  private func getLoopCount(_ timing: AnimationTiming) -> Int {
    switch timing {
    case .always: return -1
    case .specified: return 1
    }
  }
}

extension ViewController: SwiftyGifDelegate {
  
}
