import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Todo {
  Todo({
    required this.description,
    required this.id,
    this.completed = false,
    this.favorited = false,
  });

  final String id;
  final String description;
  final bool favorited;
  final bool completed;

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed, favorited: $favorited)';
  }
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        description: description,
      ),
    ];
  }

  void toggleComplete(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: !todo.completed,
            description: todo.description,
            favorited: todo.favorited,
          )
        else
          todo,
    ];
  }

  void toggleFavorite(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: todo.description,
            favorited: !todo.favorited,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            completed: todo.completed,
            description: description,
            favorited: todo.favorited,
          )
        else
          todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}
