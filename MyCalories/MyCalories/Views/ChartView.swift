import SwiftUI

struct Bar: Identifiable {
  let id = UUID()
  var name2: String
  var day: String
  var value: Double
  var color: Color
  
  static var sampleBars: [Bar] {
    var tempBars = [Bar]()
    var color: Color = .green
    let days = ["M", "T", "W", "T", "F", "S", "S"]
  
    
    for week in 1...7 {
      let randomValue = Double.random(in: 20...200)
      
      if randomValue > 150 {
        color = .red
      } else if randomValue > 75 {
        color = .yellow
      } else {
        color = .green
      }
      
      ///Single bar block
      let bar = Bar(name2: "\(week)", day: days[week-1], value: randomValue, color: color)
      tempBars.append(bar)
      
    }
    return tempBars
  }
}

struct ChartView: View {
  @State private var bars = Bar.sampleBars
  @State private var selectedID: UUID = UUID()
  @State private var text = "Info"
  
  var body: some View {
    VStack {
      Text(text)
        .bold()
        .padding()
      
      HStack(alignment: .bottom) {
        ForEach(bars) { bar in
          VStack {
            ZStack {
              Rectangle()
                .foregroundColor(bar.color)
                .frame(width: 35, height: bar.value, alignment: .bottom)
                .cornerRadius(6)
                .opacity(selectedID == bar.id ? 0.5 : 1.0)
                .onTapGesture {
                  self.selectedID = bar.id
                  self.text = "Value: \(Int(bar.value))"
                }
              Text("\(Int(bar.value))")
                .foregroundColor(.white)
            }
            Text(bar.day)
          }
        }
      }
      .frame(height: 240, alignment: .bottom)
      .padding(20)
      .background(.thinMaterial)
      .cornerRadius(12)
      
      Button("Refresh") {
        withAnimation {
          self.bars = Bar.sampleBars
        }
      }
      .padding()
      
      Spacer()
    }


  }///-view
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
