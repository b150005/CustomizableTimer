//
//  AppDelegate.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/11/18.
//

import Cocoa

@main
class AppDelegate: NSResponder, NSApplicationDelegate {
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    
  }
  
  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }
  
  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
  
  // MARK: - Core Data stack
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "CustomizableTimer")
    container.loadPersistentStores(completionHandler: { (description, error) in
      if let error = error {
        fatalError("Failed to load Core Data stack: \(error)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges == true {
      do {
        try context.save()
      }
      catch {
        print("Failed to save context: \(error)")
      }
    }
  }
}

