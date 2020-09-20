//
//  CoreDataManager.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager:NSObject {

    static let shared:CoreDataManager = CoreDataManager()
    override init() {
        super.init()
    }

    func createRecord(forEntity entity:NSEntityDescription, records:[String:String], entityName:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity =  NSEntityDescription.entity(forEntityName: entityName, in: managedContext) else { return }

        // get managed object of that entity
        let managedObjectOfEntity = NSManagedObject(entity: entity, insertInto: managedContext)

        for (key, value) in records {
            managedObjectOfEntity.setValue(value, forKey: key)
        }

        do {
            try managedContext.save()
        } catch let error as NSError {

            #if DEBUG
                print("CoreData: Failed to save Request \(error.description)")
//                fatalError("CoreData: Failed to save Request \(error.description)")
            #else
                print("CoreData: Failed to save Request \(error.description)")
            #endif
        }
    }

    func fetchRecord(forEntity entity:NSEntityDescription, entityName:String, predicate:NSPredicate, sortDescriptors:[NSSortDescriptor], fetchLimit:Int) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "author") as! String)
                print(data.value(forKey: "articleDescription") as! String)
                print(data.value(forKey: "publishedAt") as! Int64)
                print(data.value(forKey: "title") as! String)
            }
        } catch let nsError as NSError {

            #if DEBUG
                print("CoreData: Failed to fetch Request \(nsError.description)")
//                fatalError("CoreData: Failed to fetch Request \(nsError.description)")
            #else
                print("CoreData: Failed to fetch Request \(nsError.description)")
            #endif
        }
    }

    func updateRecord(forEntity entity:NSEntityDescription, records:[Dictionary<String,Any>], entityName:String) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }

        // create context from persistent container
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: entityName)

    }

    func deleteRecord(forEntity entity:NSEntityDescription) {

    }

}

