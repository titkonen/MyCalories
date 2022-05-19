import SwiftUI
import CoreData


struct ContentView: View {
  @Environment(\.managedObjectContext) var managedObjContext
  @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<CaloriesEntity>
  
  @State private var showingAddView = false
  
    var body: some View {
      NavigationView {
        VStack(alignment: .leading) {
          Text("\(Int(totalCaloriesToday())) Kcal (Today)")
            .foregroundColor(.gray)
            .padding(.horizontal)
          List {
            ForEach(food) { food in
              NavigationLink(destination: EditView(food: food)) {
                HStack {
                  VStack(alignment: .leading, spacing: 6) {
                    Text(food.name!)
                      .bold()
                    
                    Text("\(Int(food.calories))") + Text(" Calories")
                      .foregroundColor(.red)
                  }
                  Spacer()
                  Text(calcTimeSince(date:food.date!))
                    .foregroundColor(.gray)
                    .italic()
                }
              }
            }
            .onDelete(perform: deleteFood)
          }
          .listStyle(.plain)
        }///-v
        .navigationTitle("MyCalories")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              showingAddView.toggle()
            } label: {
              Label("Add Food", systemImage: "plus.circle")
            }
          }
          ToolbarItem(placement: .navigationBarLeading) {
            EditButton()
          }
        }
        .sheet(isPresented: $showingAddView) {
          AddView()
        }
      }///-navigationView ends
      .navigationViewStyle(.stack)
    }///-b

  private func deleteFood(offsets: IndexSet) {
    withAnimation {
      offsets.map { food[$0] }.forEach(managedObjContext.delete)
      
      DataController().save(context: managedObjContext)
    }
  }
  
  private func totalCaloriesToday() -> Double {
    var caloriesToday: Double = 0
    for item in food {
      if Calendar.current.isDateInToday(item.date!) {
        caloriesToday += item.calories
      }
    }
    return caloriesToday
  }
  
  
}///-S

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
