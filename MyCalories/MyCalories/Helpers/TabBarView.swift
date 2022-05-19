import SwiftUI

struct TabBarView: View {
  @AppStorage("appearance") var appearance: Appearance = .automatic
  
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
        
        ChartView()
            .tabItem({
              VStack {
                Image(systemName: "chart.bar.doc.horizontal")
                Text("Settings")
              }
            })
            .tag(1)
      }
      .accentColor(Color("primary-orange"))

    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
      TabBarView()
    }
}