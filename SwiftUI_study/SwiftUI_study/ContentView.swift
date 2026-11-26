import SwiftUI

enum Todotab {
    case all
    case completed
}

struct ContentView: View {
    @State private var todos: [ToDo] = [
        ToDo(title: "からねにお茶を淹れる", isCompleted: true),
        ToDo(title: "SwiftUIのTODOアプリを完成させる", isCompleted: false),
        ToDo(title: "GitHubに綺麗なコミットを残す", isCompleted: false),
        ToDo(title: "Liquid Glassバーを眺めてニヤニヤする", isCompleted: false)
    ]
    
    @State private var newTodoTitle = ""
    @State private var selectTabs: Todotab = .all
    private let saveKey = "saveTodos"
    
    var filteredTodos: [Binding<ToDo>] {
        $todos.filter { $todo in
            switch selectTabs {
            case .all:
                return true
            case .completed:
                return todo.isCompleted
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack(spacing: 0) {
                    HStack {
                        TextField("やることを入力...", text: $newTodoTitle)
                            .textFieldStyle(.roundedBorder)
                        Button("追加") {
                            addTodo()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(newTodoTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }
                    .padding()
                    
                    List {
                        ForEach(filteredTodos) { $todo in
                            NavigationLink {
                                TodoDetailView(todo: $todo)
                            } label: {
                                HStack {
                                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundStyle(todo.isCompleted ? .green : .gray)
                                        .font(.title3)
                                        .onTapGesture {
                                            todo.isCompleted.toggle()
                                        }
                                    Text(todo.title)
                                        .strikethrough(todo.isCompleted, color: .gray)
                                        .foregroundStyle(todo.isCompleted ? .gray : .primary)
                                }
                            }
                        }
                        .onDelete(perform: deleteTab)
                    }
                }
                LiquidGlassBar(selectTabs: $selectTabs)
                    .padding(.bottom, 16)
            }
            .navigationTitle("やることリスト")
            .onAppear{
                loadTodos()
            }
            .onChange(of: todos) {
                saveTodos()
            }
        }
    }
    
    private func addTodo() {
        let newTodo = ToDo(title: newTodoTitle)
        todos.append(newTodo)
        newTodoTitle = ""
    }
    
    private func deleteTab(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    private func saveTodos() {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadTodos() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
            let decoded = try? JSONDecoder().decode([ToDo].self, from: data) {
            todos = decoded
        }
    }
    
}
