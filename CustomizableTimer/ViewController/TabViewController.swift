//
//  TabViewController.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/18.
//

import Cocoa

class TabViewController: NSTabViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }
  
  override func viewWillAppear() {
    // 最初に表示するウィンドウフレームサイズの指定
    if let window = self.view.window {
      window.setFrame(NSRect(x: window.frame.origin.x, y: window.frame.origin.y, width: 450, height: 465), display: true)
    }
  }
  
  // タブ選択時のコールバック処理
  override func tabView(_ tabView: NSTabView, willSelect tabViewItem: NSTabViewItem?) {
    // MARK: - 動的なウィンドウフレームサイズ変更
    guard let window = self.view.window else { return }
    guard let identifier = tabViewItem?.identifier as? String else { return }
    
    var contentSize: CGSize {
      switch identifier {
      case "General":
        return CGSize(width: 450, height: 430)
      case "Analog":
        return CGSize(width: 450, height: 480)
      case "Digital":
        return CGSize(width: 450, height: 525)
      default:
        return CGSize(width: 450, height: 300)
      }
    }
    let newWindowSize = window.frameRect(forContentRect: CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height)).size
    
    var frame = window.frame
    frame.origin.y += frame.size.height
    frame.origin.y -= newWindowSize.height
    frame.size = newWindowSize
    
    // ウィンドウフレームサイズの変更
    window.setFrame(frame, display: false, animate: true)
  }
}
