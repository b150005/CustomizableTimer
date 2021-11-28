//
//  GeneralViewController.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/18.
//

import Cocoa

class GeneralViewController: NSViewController {
  // MARK: - 全般
  @IBOutlet weak var isDigitalSwitch: NSSwitch!
  @IBOutlet weak var showAnimationInFrontSwitch: NSSwitch!
  // MARK: - アニメーション(前面)
  @IBOutlet weak var frontAnimationTimingComboBox: NSComboBox!
  @IBOutlet weak var frontAnimationSwitch: NSSwitch!
  @IBOutlet weak var frontAnimationFilePathTextField: NSTextField!
  // MARK: - アニメーション(背面)
  @IBOutlet weak var backAnimationTimingComboBox: NSComboBox!
  @IBOutlet weak var backAnimationSwitch: NSSwitch!
  @IBOutlet weak var backAnimationFilePathTextField: NSTextField!
  // MARK: - アニメーション表示時刻
  @IBOutlet weak var animationShowTime1DatePicker: NSDatePicker!
  @IBOutlet weak var animationShowTime2DatePicker: NSDatePicker!
  @IBOutlet weak var animationShowTime3DatePicker: NSDatePicker!
  @IBOutlet weak var animationShowTimer4DatePicker: NSDatePicker!
  @IBOutlet weak var animationShowTime5DatePicker: NSDatePicker!
  
  let general: General = General.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Viewの初期化
    self.reloadGeneralView()
  }
  
  @IBAction func toggleIsDigital(_ sender: NSSwitch) {
    general.isDigital.toggle()
  }
  
  @IBAction func toggleShowAnimationInFront(_ sender: NSSwitch) {
    general.showAnimationInFront.toggle()
  }
  
  @IBAction func selectAnimationTiming(_ sender: NSComboBox) {
    let timing: AnimationTiming
    switch sender.indexOfSelectedItem {
    case 0: timing = .always
    case 1: timing = .specified
    default: return
    }
    
    switch sender.tag {
    case 1: general.frontAnimationTiming = timing
    case 2: general.backAnimationTiming = timing
    default: return
    }
  }
  
  @IBAction func toggleShowAnimation(_ sender: NSSwitch) {
    switch sender.tag {
    case 1: general.showFrontAnimation.toggle()
    case 2: general.showBackAnimation.toggle()
    default: return
    }
  }
  
  @IBAction func selectAnimationFile(_ sender: NSButton) {
    let url: URL? = self.getSingleFileURLWithOpenPanel()
    guard let url = url else { return }
    switch sender.tag {
    case 1: general.frontAnimationFilePath = url
    case 2: general.backAnimationFilePath = url
    default: return
    }
    // UIの更新
    self.reloadTextField()
  }
  
  @IBAction func specifyAnimationShowTime(_ sender: NSDatePicker) {
    switch sender.tag {
    case 1: general.animationShowTime1 = sender.dateValue
    case 2: general.animationShowTime2 = sender.dateValue
    case 3: general.animationShowTime3 = sender.dateValue
    case 4: general.animationShowTime4 = sender.dateValue
    case 5: general.animationShowTime5 = sender.dateValue
    default: return
    }
  }
}

extension NSViewController {
  /// NSOpenPanelを用いてURLを取得
  func getSingleFileURLWithOpenPanel() -> URL? {
    let openPanel = NSOpenPanel()
    openPanel.message = "gifファイルの選択"
    openPanel.canChooseFiles = true
    openPanel.canChooseDirectories = false
    openPanel.allowsMultipleSelection = false
    openPanel.allowedFileTypes = ["gif"]
    
    if openPanel.runModal() == NSApplication.ModalResponse.OK {
      return URL(fileURLWithPath: openPanel.url!.path)
    }
    return nil
  }
}

// MARK: - Viewの初期化
extension GeneralViewController {
  /// 各Viewの初期化
  private func reloadGeneralView() {
    // Switch
    self.reloadSwitch()
    // ComboBox
    self.reloadComboBox()
    // TextField
    self.reloadTextField()
    // DatePicker
    self.reloadDatePicker()
  }
  
  /// Switchの初期化
  private func reloadSwitch() {
    // MARK: - 全般
    isDigitalSwitch.state = general.isDigital ? .on : .off
    showAnimationInFrontSwitch.state = general.showAnimationInFront ? .on : .off
    // MARK: - アニメーション(前面)
    frontAnimationSwitch.state = general.showFrontAnimation ? .on : .off
    // MARK: - アニメーション(背面)
    backAnimationSwitch.state = general.showBackAnimation ? .on : .off
  }
  
  /// ComboBoxの初期化
  private func reloadComboBox() {
    // MARK: - アニメーション(前面)
    switch general.frontAnimationTiming {
    case AnimationTiming.always: frontAnimationTimingComboBox.selectItem(at: 0)
    case AnimationTiming.specified:
      frontAnimationTimingComboBox.selectItem(at: 1)
    }
    // MARK: - アニメーション(背面)
    switch general.backAnimationTiming {
    case AnimationTiming.always:
      backAnimationTimingComboBox.selectItem(at: 0)
    case AnimationTiming.specified:
      backAnimationTimingComboBox.selectItem(at: 1)
    }
  }
  
  /// TextFieldの初期化
  private func reloadTextField() {
    // MARK: - アニメーション(前面)
    if let frontUrl = general.frontAnimationFilePath {
      frontAnimationFilePathTextField.stringValue = frontUrl.path
    }
    // MARK: - アニメーション(背面)
    if let backUrl = general.backAnimationFilePath {
      backAnimationFilePathTextField.stringValue = backUrl.path
    }
  }
  
  /// DatePickerの初期化
  private func reloadDatePicker() {
    animationShowTime1DatePicker.dateValue = general.animationShowTime1
    animationShowTime2DatePicker.dateValue = general.animationShowTime2
    animationShowTime3DatePicker.dateValue = general.animationShowTime3
    animationShowTimer4DatePicker.dateValue = general.animationShowTime4
    animationShowTime5DatePicker.dateValue = general.animationShowTime5
  }
}
