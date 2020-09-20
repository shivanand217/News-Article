//
//  CoreDataManager.swift
//  News-Article
//
//  Created by Apple on 19/09/20.
//

import Foundation
import CoreData
import UIKit

enum EntityName {
    case article
    func getEntityName() -> String {
        switch self {
        case .article:
            return "Article"
        }
    }
}

class CoreDataManager:NSObject {

    static let shared:CoreDataManager = CoreDataManager()
    override init() {
        super.init()
    }

    func createRecord(records:[String:String], entityName:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return }

        let managedContext = appDelegate.persistentContainer.viewContext
        guard let entity =  NSEntityDescription.entity(forEntityName: entityName, in: managedContext) else { return }
        
        let managedObjectOfEntity = NSManagedObject(entity: entity, insertInto: managedContext)

        for (key, value) in records {
            managedObjectOfEntity.setValue(value, forKey: key)
        }

        do {
            try managedContext.save()
            print("CoreData:article saved..")
        } catch let error as NSError {

            #if DEBUG
                print("CoreData: Failed to save Request \(error.description)")
//                fatalError("CoreData: Failed to save Request \(error.description)")
            #else
                print("CoreData: Failed to save Request \(error.description)")
            #endif
        }
    }

    func fetchRecord(entityName:String, predicate:NSPredicate?, sortDescriptors:[NSSortDescriptor]?, fetchLimit:Int?) -> [NSManagedObject] {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else { return [] }

        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "author") as? String ?? "")
                print(data.value(forKey: "url") as? String ?? "")
                print(data.value(forKey: "articleDescription") as? String ?? "")
                print(data.value(forKey: "publishedAt") as? String ?? "")
                print(data.value(forKey: "title") as? String ?? "")
                print(data.value(forKey: "urlToImage") as? String ?? "")
            }
            return result as! [NSManagedObject]
        } catch let nsError as NSError {

            #if DEBUG
                print("CoreData: Failed to fetch Request \(nsError.description)")
//                fatalError("CoreData: Failed to fetch Request \(nsError.description)")
            #else
                print("CoreData: Failed to fetch Request \(nsError.description)")
            #endif
            return []
        }
    }

    func deleteRecord(forEntity entity:NSEntityDescription) {}

}
