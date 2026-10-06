import SwiftUI
import Playgrounds

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("A").padding().foregroundStyle(.yellow)
            Text("B").foregroundStyle(.yellow).padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
