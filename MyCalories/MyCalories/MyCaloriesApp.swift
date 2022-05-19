import SwiftUI

@main
struct MyCaloriesApp: App {
  
  // Injecting
  @StateObject private var dataController = DataController()
  
  @AppStorage("appearance") var appearance: Appearance = .automatic
  
  
    var body: some Scene {
        WindowGroup {
          TabBarView()
            ///Injecting
            .environment(\.managedObjectContext, dataController.container.viewContext)
          
          
//          TabBarView()
//              .environment(\.managedObjectContext, PersistenceManager.shared.persistentContainer.viewContext)
          
        }
    }
}
