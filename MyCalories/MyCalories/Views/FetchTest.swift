import SwiftUI

struct FetchTest: View {
  @Environment(\.managedObjectContext) var managedObjContext
  
  @FetchRequest(sortDescriptors: [
    SortDescriptor(\.calories)
  ]) var food: FetchedResults<CaloriesEntity>

  @State private var name = ""
  @State private var calories: Double = 0
  var color: Color = .blue
    
    var body: some View {
      List {
        ForEach(food) { food in
          HStack {
            Text(food.name ?? "Unknown name")
              .onAppear {
                calories = food.calories
                name = food.name!
              }
          }
          ZStack {
            Rectangle()
//              .foregroundColor(.blue)
              .foregroundColor(color)
              .frame(width: food.calories, height: 15, alignment: .trailing)
              .cornerRadius(5)
            Text("\(Int(food.calories))")
              .foregroundColor(.white)
              .font(.caption)
          }
          

        }///-ForEach
      } ///-List
    }///-View
}///-Struct

//struct FetchTest_Previews: PreviewProvider {
//    static var previews: some View {
//        FetchTest()
//    }
//}
