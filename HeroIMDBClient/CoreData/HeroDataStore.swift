//
//  HeroDataStore.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 31/01/21.
//

import CoreData

/// Enum that allows coredata to store in memory, that is for Testing porpuses
public enum StorageType {
    case disk
    case inMemory
}

/// Store for the solution
public class HeroDataStore {
    
    let persistentContainer: NSPersistentContainer
    let storageType: StorageType
    
    init(_ storageType: StorageType = .disk) {
        let bundle = Bundle(for: HeroDataStore.self)
        guard let mom = NSManagedObjectModel.mergedModel(from: [bundle]) else {
            fatalError()
        }
        self.storageType = storageType
        self.persistentContainer = NSPersistentContainer(name: "MoviesContainer",
                                                         managedObjectModel: mom)
        if storageType == .inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            self.persistentContainer.persistentStoreDescriptions = [description]
        }
        
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            self.persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error {
                print("Error loading PersistentStores \(error.localizedDescription)")
            }
        }
        
    }
    
    func save() {
        let context = self.persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            } catch {
                print("Error saving context \(error.localizedDescription)")
            }
        }
    }
}
