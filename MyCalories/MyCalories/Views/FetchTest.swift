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
//              .frame(width: 320, alignment: .leading)
//              .background(.yellow)
              
            }///-VStack
//            .frame(width: 340, alignment: .bottom)
//            .background(.orange)

            
          }///ForEach Ends
          

        
        // .frame(maxWidth: .infinity)
        
        
        
        
      
      }///-List
      
    }///-View
}///-Struct

struct FetchTest_Previews: PreviewProvider {
    static var previews: some View {
        FetchTest()
    }
}
