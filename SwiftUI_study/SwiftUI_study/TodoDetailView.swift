import SwiftUI

struct TodoDetailView: View {
    
    @Binding var todo: ToDo
    var body: some View {
        Form {
            Section("TODOs title") {
                TextField("タイトルを編集", text: $todo.title)
            }
            
            Section("ステータス") {
                Toggle("完了にする", isOn: $todo.isCompleted)
            }
        }
        .navigationTitle("詳細・編集")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        TodoDetailView(todo: .constant(ToDo(title: "からねにお茶を淹れる", isCompleted: true)))
    }
}
