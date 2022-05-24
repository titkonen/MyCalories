import SwiftUI

struct EditView: View {
  @Environment(\.managedObjectContext) var managedObjContext
  @Environment(\.dismiss) var dismiss
  
  var food: FetchedResults<CaloriesEntity>.Element
  
  @State private var name = ""
  @State private var calories: Double = 0
  
    var body: some View {
      Form {
        Section {
          TextField("\(food.name!)", text: $name)
            .onAppear {
              name = food.name!
              calories = food.calories
            }
          VStack {
            Text("Calories: \(Int(calories))")
            Slider(value: $calories, in: 0...990, step: 10)
          }
          .padding()
          
          HStack {
            Spacer()
            Button("Submit") {
              DataController().edit(food: food, name: name, calories: calories, context: managedObjContext)
              dismiss()
            }
            Spacer()
          }
        }
        
      }
      
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
