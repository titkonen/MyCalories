import Foundation
import CoreData

class DataController: ObservableObject {
  let container = NSPersistentContainer(name: "CaloriesModel")
  
  init() {
    container.loadPersistentStores { desc, error in
      if let error = error {
        print("Failed to load the data \(error.localizedDescription)")
      }
    }
  }
  
  func save(context: NSManagedObjectContext) {
    do {
      try context.save()
      print("Data Saved!")
    } catch {
      print("Couldn't save the data")
    }
  }
  
  func add(name: String, calories: Double, context: NSManagedObjectContext) {
    let food = CaloriesEntity(context: context)
    food.id = UUID()
    food.date = Date()
    food.name = name
    food.calories = calories
    
    save(context: context)
  }
  
  func edit(food: CaloriesEntity, name: String, calories: Double, context: NSManagedObjectContext) {
    food.date = Date()
    food.name = name
    food.calories = calories
    
    save(context: context)
  }
  
}
