import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constant.dart';
import '/models/todo.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(id: '1', description: 'Take a shower'),
    Todo(id: '2', description: 'Bathe the dogs'),
    Todo(id: '3', description: 'Go grocery shopping'),
  ]);
});

final todoListFilter = StateProvider((_) => TodoListFilter.all);

final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});

final favoritedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => todo.favorited).length;
});

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.doing:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.done:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.favorite:
      return todos.where((todo) => todo.favorited).toList();
    case TodoListFilter.all:
      return todos;
  }
});

final currentTodo = Provider<Todo>((ref) => throw UnimplementedError());
