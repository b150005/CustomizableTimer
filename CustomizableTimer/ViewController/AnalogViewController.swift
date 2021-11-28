//
//  AnalogViewController.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/18.
//

import Cocoa

class AnalogViewController: NSViewController {
  // MARK: - アナログ
  @IBOutlet weak var faceFilePathTextField: NSTextField!
  @IBOutlet weak var hourFilePathTextField: NSTextField!
  @IBOutlet weak var minuteFilePathTextField: NSTextField!
  @IBOutlet weak var secondFilePathTextField: NSTextField!
  
  let general: General = General.shared
  let analog: Analog = Analog.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // TextFieldの初期化
    self.reloadTextField()
  }
  
  @IBAction func selectAnalogFile(_ sender: NSButton) {
    let url: URL? = self.getSingleFileURLWithOpenPanel()
    guard let url = url else { return }
    switch sender.tag {
    case 1: analog.faceFilePath = url
    case 2: analog.hourFilePath = url
    case 3: analog.minuteFilePath = url
    case 4: analog.secondFilePath = url
    default: return
    }
    // TextFieldの更新
    self.reloadTextField()
  }
}

extension AnalogViewController {
  /// TextFieldの初期化
  private func reloadTextField() {
    if let faceUrl = analog.faceFilePath {
      faceFilePathTextField.stringValue = faceUrl.path
    }
    if let hourUrl = analog.hourFilePath {
      hourFilePathTextField.stringValue = hourUrl.path
    }
    if let minuteUrl = analog.minuteFilePath {
      minuteFilePathTextField.stringValue = minuteUrl.path
    }
    if let secondUrl = analog.secondFilePath {
      secondFilePathTextField.stringValue = secondUrl.path
    }
  }
}
