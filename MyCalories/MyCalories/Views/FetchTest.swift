import SwiftUI

struct FetchTest: View {
  @Environment(\.managedObjectContext) var managedObjContext
//  @Environment(\.dismiss) var dismiss
//
//  var food: FetchedResults<CaloriesEntity>.Element
  
  @State private var name = ""
  @State private var calories: Double = 0
  
  @FetchRequest(sortDescriptors: [
    SortDescriptor(\.calories)
  ]) var food: FetchedResults<CaloriesEntity>
  
    var body: some View {
      List {
        ForEach(food) { food in
          HStack {
            Text(food.name ?? "Unknown name")
              .onAppear {
                calories = food.calories
                name = food.name!
              }
            Spacer()
//            Text("Calories: \(Int(food.calories))")
//              .font(.caption)
          }
          ZStack {
            Rectangle()
              .foregroundColor(.blue)
              .frame(width: food.calories, height: 15, alignment: .trailing)
              .cornerRadius(5)

            Text("\(Int(food.calories))")
              .foregroundColor(.white)
              .font(.caption)
          }
          

        }///ForEach Ends
      }
      
      
    }
  
}

struct FetchTest_Previews: PreviewProvider {
    static var previews: some View {
        FetchTest()
    }
}
