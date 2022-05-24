import SwiftUI

//private func barColour() -> Color {
//  @FetchRequest(sortDescriptors: [
//    SortDescriptor(\.calories)
//  ]) var food: FetchedResults<CaloriesEntity>
//
////  var calories: Double = 0
////  var calories = food.calories
//  var color: Color = .gray
//
//
//  // MARK: CRITICAL POINT
//  let barColourScale: Double = 201
//
//  if calories > 200 {
//    color = .red
//  } else if calories > 100 {
//    color = .orange
//  } else {
//    color = .green
//  }
//
//  return color
//}

struct ColourChart: View {
  @Environment(\.managedObjectContext) var managedObjContext
  
  @FetchRequest(sortDescriptors: [
    SortDescriptor(\.calories)
  ]) var food: FetchedResults<CaloriesEntity>

  @State private var name = ""
  @State private var calories: Double = 0
  var color: Color = .gray
    
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
              .foregroundColor(.orange)
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





//struct ColourChart_Previews: PreviewProvider {
//    static var previews: some View {
//        ColourChart()
//    }
//}
