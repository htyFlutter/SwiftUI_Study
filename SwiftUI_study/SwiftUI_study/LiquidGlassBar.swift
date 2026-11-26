import SwiftUI

struct LiquidGlassBar: View {
    
    @Binding var selectTabs: Todotab
    
    var body: some View {
        HStack(spacing: 30) {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectTabs = .all
                }
            } label: {
                Label("すべて", systemImage: "list.bullet")
                    .fontWeight(selectTabs == .all ? .bold : .regular)
                    .foregroundStyle(selectTabs == .all ? .blue : .secondary)
            }
            
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectTabs = .completed
                }
            } label: {
                Label("完了", systemImage: "checkmark.seal.fill")
                    .fontWeight(selectTabs == .completed ? .bold : .regular)
                    .foregroundStyle(selectTabs == .completed ? .green : .secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .glassEffect(.regular, in: Capsule())
        .shadow(color: .black.opacity(0.12), radius: 10, y: 5)
    }
}

#Preview {
    LiquidGlassBar(selectTabs: .constant(.all))
}
