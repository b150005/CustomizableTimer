//
//  NSImage.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/25.
//

import Cocoa

/// [引用元](https://stackoverflow.com/questions/31699235/rotate-nsimage-in-swift-cocoa-mac-osx)
extension NSImage {
  /// Rotates the image by the specified degrees around the center.
  /// Note that if the angle is not a multiple of 90°, parts of the rotated image may be drawn outside the image bounds.
  // MARK: - This is nice but only works for square images. Rectangular ones get cropped.
  public func rotated(by angle: CGFloat) -> NSImage {
    let img = NSImage(size: self.size, flipped: false, drawingHandler: { (rect) -> Bool in
      let (width, height) = (rect.size.width, rect.size.height)
      let transform = NSAffineTransform()
      transform.translateX(by: width / 2, yBy: height / 2)
      transform.rotate(byDegrees: -angle)
      transform.translateX(by: -width / 2, yBy: -height / 2)
      transform.concat()
      self.draw(in: rect)
      return true
    })
    img.isTemplate = self.isTemplate // preserve the underlying image's template setting
    return img
  }
}
