import SwiftUI

@main
struct MyCaloriesApp: App {
  
  // Injecting
  @StateObject private var dataController = DataController()
  
    var body: some Scene {
        WindowGroup {
            ContentView()
            ///Injecting
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
