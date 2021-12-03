//
//  FrontAnimation+CoreDataProperties.swift
//  CustomizableTimer
//
//  Created by 伊藤 直輝 on 2021/12/01.
//
//

import Foundation
import CoreData


extension FrontAnimation {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<FrontAnimation> {
    return NSFetchRequest<FrontAnimation>(entityName: "FrontAnimation")
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

extension FrontAnimation : Identifiable {
  
}
