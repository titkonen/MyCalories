import SwiftUI

struct TabBarView: View {
  @AppStorage("appearance") var appearance: Appearance = .automatic
  
//  var food: FetchedResults<CaloriesEntity>.Element
  
    var body: some View {
      TabView {
        ContentView()
          .tabItem({
            VStack {
              Image(systemName: "list.bullet")
              Text("Food List")
            }
          })
          .tag(0)
          .preferredColorScheme(appearance.getColorScheme())
        
        ColourChart()
            .tabItem({
              VStack {
                Image(systemName: "chart.bar.doc.horizontal")
                Text("Charts")
              }
            })
            .tag(1)
        
//        ChartView()
//            .tabItem({
//              VStack {
//                Image(systemName: "chart.bar.fill")
//                Text("ChartView")
//              }
//            })
//            .tag(1)
//
//        FetchTest()
//            .tabItem({
//              VStack {
//                Image(systemName: "chart.bar.doc.horizontal")
//                Text("FetchTest")
//              }
//            })
//            .tag(2)

        
      }
      .accentColor(Color("primary-green"))

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView()
    }
}
