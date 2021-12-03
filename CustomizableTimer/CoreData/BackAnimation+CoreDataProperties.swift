//
//  FrontAnimation+CoreDataProperties.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/12/01.
//
//

import Foundation
import CoreData


extension BackAnimation {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<BackAnimation> {
    return NSFetchRequest<BackAnimation>(entityName: "BackAnimation")
  }
  
  @NSManaged public var date1: Date?
  @NSManaged public var date2: Date?
  @NSManaged public var date3: Date?
  @NSManaged public var date4: Date?
  @NSManaged public var date5: Date?
  @NSManaged public var isAlways: Bool
  @NSManaged public var isDisplayed: Bool
  @NSManaged public var url: URL?
  
}

extension BackAnimation : Identifiable {
  
}
