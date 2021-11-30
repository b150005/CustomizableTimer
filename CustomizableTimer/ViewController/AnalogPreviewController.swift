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
  var showBackLatestAnimation: Bool = false
  
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
    self.stopCurrentTimer()
  }
  
  /// Timerオブジェクトの解放
  private func stopCurrentTimer() {
    if let timer = self.timer {
      timer.invalidate()
      self.timer = nil
    }
  }
}

extension AnalogPreviewController {
  // MARK: - レイヤー
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
  
  /// アナログ時計のプレビューの描画
  func reloadAnalogPreview() {
    // アナログ時計の画像ファイルの読込
    self.reloadClockImage()
    // アナログ時計の回転アニメーションの開始
    self.startClockAnimation()
    // 常に表示するアニメーションの読込
    self.reloadAlwaysVisibleAnimation()
    // 指定時に表示するアニメーションの読込
    self.setLatestAnimationAndTimer()
  }
  
  // MARK: - アナログ時計
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
  /// 常に表示するアニメーションの描画
  private func reloadAlwaysVisibleAnimation() {
    // アニメーション(前面)
    if self.general.showFrontAnimation == true && self.general.frontAnimationTiming == .always {
      if let url = self.general.frontAnimationFilePath {
        self.frontAnimationImageView.setGifFromURL(url)
      }
    }
    else {
      self.frontAnimationImageView.clear()
    }
    
    // アニメーション(背面)
    if self.general.showBackAnimation == true && self.general.backAnimationTiming == .always {
      if let url = self.general.backAnimationFilePath {
        self.backAnimationImageView.setGifFromURL(url)
      }
    }
    else {
      self.backAnimationImageView.clear()
    }
  }
  
  /// 指定時に表示するアニメーションのうち、最も現在時刻に近いものをセット
  private func setLatestAnimationAndTimer() {
    self.stopCurrentTimer()
    
    if let dateFront = self.general.getLatestShowTime(false) {
      if let dateBack = self.general.getLatestShowTime(true) {
        // 前面・背面の両方が設定
        // → 同時刻に前面・背面の両方で設定されている場合は前面に設定しているアニメーションが優先される
        self.showBackLatestAnimation = dateFront > dateBack ? true : false
        self.timer = Timer(
          fireAt: self.showBackLatestAnimation ? dateBack : dateFront,
          interval: 0,
          target: self,
          selector: #selector(self.showAnimationOnce),
          userInfo: nil,
          repeats: false)
      }
      // 前面のみ
      else {
        self.showBackLatestAnimation = false
        self.timer = Timer(
          fireAt: dateFront,
          interval: 0,
          target: self,
          selector: #selector(self.showAnimationOnce),
          userInfo: nil,
          repeats: false)
      }
    }
    else {
      // 背面のみ
      if let date = self.general.getLatestShowTime(true) {
        self.showBackLatestAnimation = true
        self.timer = Timer(
          fireAt: date,
          interval: 0,
          target: self,
          selector: #selector(self.showAnimationOnce),
          userInfo: nil,
          repeats: false)
      }
    }
    
    if let timer = self.timer {
      RunLoop.main.add(timer, forMode: .common)
    }
  }
  
  /// アニメーションを1度だけ再生
  @objc private func showAnimationOnce() {
    if self.showBackLatestAnimation == false {
      
    }
    else {
      
    }
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
