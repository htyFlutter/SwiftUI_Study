import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("カウント: \(count)")
                .font(.largeTitle)
                .foregroundStyle(count == 0 ? .red : .primary)
            
            
            HStack(spacing: 20) {
                Button("増やす") {
                    count += 1
                }
                Button("減らす") {
                    count -= 1
                }
            }
            Button("リセットおおおおおおおおお") {
                count = 0
            }
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}

