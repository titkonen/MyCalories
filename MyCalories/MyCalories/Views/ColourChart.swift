import SwiftUI

struct ColourChart: View {
  @Environment(\.managedObjectContext) var managedObjContext
  @State private var name = ""
  @State var calories: Double = 0
  @State var color: Color = .gray
  
  @FetchRequest(sortDescriptors: [SortDescriptor(\.calories)]) var food: FetchedResults<CaloriesEntity>
  
    var body: some View {
      NavigationView {
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
                  Text(calcTimeSince(date:food.date!))
                    .foregroundColor(.gray)
                    .font(.caption)
                    .italic()
                }///-HStack
                ZStack {
                  Rectangle()
                    .foregroundColor(colouredBars(calories:food.calories))
                    .frame(width: food.calories/3, height: 15, alignment: .trailing)
                    .cornerRadius(5)
                  Text("\(Int(food.calories))")
                    .foregroundColor(.white)
                    .font(.caption)
                }///-ZStack
              }///-VStack
            }///ForEach Ends
        }///-List
        
        
        .navigationTitle("Charts")
      }
      


    }///-View
  
  func colouredBars(calories: Double) -> Color {
    if calories >= 600 {
      print("color red")
      return .red
    } else if calories >= 300 {
      print("color yellow")
      return .yellow
    } else {
      print("color green")
      return .green
    }
     return .clear
  }
  
}///-Struct

struct ColourChart_Previews: PreviewProvider {
    static var previews: some View {
      ColourChart()
    }
}
