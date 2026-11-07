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
                .buttonStyle(.borderedProminent)
                Button("減らす") {
                    count = max(0, count - 1)
                }
                .buttonStyle(.bordered)
                .disabled(count == 0)
            }
            Button("リセットおおおおおおおおお") {
                count = 0
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .disabled(
                count == 0)
        }
    }
}

#Preview {
    ContentView().preferredColorScheme(.dark)
}

