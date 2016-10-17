//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Nehemiah Odior on 10/14/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//


import CoreData
import Foundation
import UIKit

class Note: NSManagedObject {
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var modificationTime: Date?
    
    convenience init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)
        self.init(entity: entity!, insertInto: managedContext)
    }
}
