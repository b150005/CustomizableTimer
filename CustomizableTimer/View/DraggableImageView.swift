//
//  DraggableImageView.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/23.
//

import Cocoa

/// ドラッグによるウィンドウ移動が可能なNSImageView
class DraggableImageView: NSImageView {
  override var mouseDownCanMoveWindow: Bool {
    get { return true }
  }
  override var animates: Bool {
    get { return true }
    set {}
  }
  override func draw(_ dirtyRect: NSRect) {
    super.draw(dirtyRect)
  }
}
