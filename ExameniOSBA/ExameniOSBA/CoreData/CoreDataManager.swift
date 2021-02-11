//
//  CoreDataManager.swift
//  ExameniOSBA
//
//  Created by Armando Carrillo on 10/02/21.
//

import Foundation
import CoreData

class CoreDataManager {
   
    private let container : NSPersistentContainer!
    
    init() {
        container = NSPersistentContainer(name: "ExameniOSBA")
        
        setupDatabase()
    }
    
    private func setupDatabase() {
        
        container.loadPersistentStores { (desc, error) in
        if let error = error {
            print("Error loading store \(desc) — \(error)")
            return
        }
        print("Database ready!")
    }
}
    
}

extension CoreDataManager {
    
    func createUser(name : String, completion: @escaping() -> Void) {
        // 2
        let context = container.viewContext
      
        // 3
        let user = Person(context: context)
        user.name = name
       
        // 4
        
        // 5
        do {
            try context.save()
            print("Usuario \(name) guardado")
            completion()
        } catch {
         
          print("Error guardando usuario — \(error)")
           
        }
    }
}
