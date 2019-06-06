//
//  CoreDataManager.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/5/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private(set) var categories: [Category] = []
    
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var mostViewedCategories: [Category] {
        return categories.sorted{ $0.name ?? "" < $1.name  ?? "" }.sorted{ $0.hasFavorites?.tapCount ?? 0 > $1.hasFavorites?.tapCount ?? 0}
    }
    
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Picolx")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    init() {
        self.categories = getCategories()
    }
    
    // MARK: - Core Data Saving support
    
    func saveCategory(categoryName: String) {
        let first =  categories.filter{ $0.name == categoryName }.first
        if let category = first {
            category.hasFavorites?.tapCount += 1
        } else {
            let category = Category(context: managedObjectContext)
            category.name = categoryName
            let favorite = Favorite(context: managedObjectContext)
            favorite.tapCount = 1
            category.hasFavorites = favorite
            categories.append(category)
        }
        saveContext()
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetch support
    
    func fetch<T: NSManagedObject>(sortDescriptors: [NSSortDescriptor] = [NSSortDescriptor(key: "hasFavorites.tapCount", ascending: false),  ]) throws -> [T] {
        let request = NSFetchRequest<T>(entityName: T.className)
        request.sortDescriptors = sortDescriptors
        var results: [T] = []
        do {
            results = try managedObjectContext.fetch(request) 
        } catch {
            throw error
        }
        return results
    }
    
    private func getCategories() -> [Category] {
        var categories: [Category] = []
        do {
            categories = try fetch()
        } catch {
            print(error.localizedDescription)
        }
        return categories
    }
    
    // MARK: - Core Data Deleting support
    
    func purgeData() {
        
        do {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Category.className)
            let fetchRequestImages = NSFetchRequest<NSFetchRequestResult>(entityName: Favorite.className)
            do {
                let objects  = try managedObjectContext.fetch(fetchRequest) as? [NSManagedObject]
                let imageObjects  = try managedObjectContext.fetch(fetchRequestImages) as? [NSManagedObject]
                _ = objects.map{$0.map{managedObjectContext.delete($0)}}
                _ = imageObjects.map{$0.map{managedObjectContext.delete($0)}}
                saveContext()
            } catch let error {
                print("error while purging data: \(error)")
            }
        }
    }
}
