//
//  DataManager.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/12/01.
//

import Foundation
import CoreData

/// [引用元](https://qiita.com/touyoubuntu/items/5133ba503da74bb39063)
class DataManager {
  static let shared: DataManager = DataManager()
  private var persistentContainer: NSPersistentContainer!
  let context: NSManagedObjectContext
  
  private init() {
    persistentContainer = NSPersistentContainer(name: "CustomizableTimer")
    persistentContainer.loadPersistentStores { (description, error) in
      if let error = error {
        fatalError("Failed to load Core Data stack: \(error)")
      }
    }
    context = persistentContainer.viewContext
  }
  
  func create<T: NSManagedObject>() -> T {
    let object = NSEntityDescription.insertNewObject(
      forEntityName: String(describing: T.self),
      into: context) as! T
    return object
  }
  
  func saveContext() {
    do {
      try context.save()
    }
    catch {
      print("Failed to save context: \(error)")
    }
  }
  
  func getFetchedResultsController<T: NSManagedObject>(with descriptor: [String] = []) -> NSFetchedResultsController<T> {
    let fetchRequest = NSFetchRequest<T>(entityName: String(describing: T.self))
    fetchRequest.sortDescriptors = descriptor.map { NSSortDescriptor(key: $0, ascending: true) }
    return NSFetchedResultsController<T>(
      fetchRequest: fetchRequest,
      managedObjectContext: context,
      sectionNameKeyPath: nil,
      cacheName: nil)
  }
}
