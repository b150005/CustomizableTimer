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
    
    // プレビューの読込
    self.reloadAnalogPreview()
  }
}

extension AnalogPreviewController {
  /// プレビューの読込
  func reloadAnalogPreview() {
    // アナログ時計
    self.reloadClock()
  }
  
  /// アナログ時計の描画
  private func reloadClock() {
    if let faceUrl = analog.faceFilePath {
      faceImageView.setGifFromURL(faceUrl)
    }
    if let hourUrl = analog.hourFilePath {
      hourImageView.setGifFromURL(hourUrl)
    }
    if let minuteUrl = analog.minuteFilePath {
      minuteImageView.setGifFromURL(minuteUrl)
    }
    if let secondUrl = analog.secondFilePath {
      secondImageView.setGifFromURL(secondUrl)
    }
  }
  
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
