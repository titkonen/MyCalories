import SwiftUI

struct FetchTest: View {
  @Environment(\.managedObjectContext) var managedObjContext
  
  @State private var name = ""
  @State private var calories: Double = 0
  
  @FetchRequest(sortDescriptors: [
    SortDescriptor(\.calories)
  ]) var food: FetchedResults<CaloriesEntity>
  
    var body: some View {
      List {

          ForEach(food) { food in
            VStack(alignment: .leading) {
              HStack(alignment: .top) {
                Text(food.name ?? "Unknown name")
                  .onAppear {
                    calories = food.calories
                    name = food.name!
                  }
                Spacer()
//                Text("Calories: \(Int(food.calories))")
//                  .font(.caption)
//                  .foregroundColor(.gray)
                Text(calcTimeSince(date:food.date!))
                  .foregroundColor(.gray)
                  .font(.caption)
                  .italic()
              }///-HStack

              
              ZStack {
                Rectangle()
                  .foregroundColor(.blue)
                  .frame(width: food.calories/3, height: 15, alignment: .trailing)
                  .cornerRadius(5)

                Text("\(Int(food.calories))")
                  .foregroundColor(.white)
                  .font(.caption)
              }///-ZStack
              
            }///-VStack
            
          }///ForEach Ends
 
      }///-List
      
    }///-View
}///-Struct

struct FetchTest_Previews: PreviewProvider {
    static var previews: some View {
        FetchTest()
    }
}
