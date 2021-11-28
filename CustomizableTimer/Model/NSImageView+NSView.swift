//
//  NSImageView+NSView.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/25.
//

import Cocoa

/// [引用元](https://gist.github.com/Hexfire/b2cc9b225b0ae14698c6179163d8d29a)
extension NSImageView {
  /// 時計回りに指定した時間・回数だけ回転するアニメーションの開始
  func spinClockwise(_ duration: Double, repeatCount: Float = .infinity) {
    self.wantsLayer = true
    // アンカーポイントの設定
    self.setAnchorPoint(CGPoint(x: 0.5, y: 0.5))
    
    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
    rotateAnimation.fromValue = 0.0
    rotateAnimation.toValue = -CGFloat.pi * 2.0
    rotateAnimation.duration = duration
    rotateAnimation.repeatCount = repeatCount
    
    self.layer?.add(rotateAnimation, forKey: nil)
  }
  
  private func showAnimationAtSpecifiedTime() {
    
  }
  
  /// アニメーションの停止
  func stopAnimations() {
    self.layer?.removeAllAnimations()
  }
}

extension NSView {
  /// Viewの表示位置(position)を変えずにCALayerの`anchorPoint`を変更
  func setAnchorPoint(_ anchorPoint: CGPoint) {
    guard let layer = self.layer else { return }
    
    let origin: CGPoint = layer.frame.origin
    // anchorPointの設定 → frameの表示位置(position)が移動
    layer.anchorPoint = anchorPoint
    // frameの表示位置(position)を元の位置に変更
    layer.frame.origin = origin
  }
}
