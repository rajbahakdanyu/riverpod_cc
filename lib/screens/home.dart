import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/constant.dart';
import '/models/todo.dart';
import '/widgets/custom_text_button.dart';
import '/widgets/todo_item.dart';

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

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodos);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  'Todo',
                  style: Theme.of(context).textTheme.headline3,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter task here',
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .8,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ),
                  controller: taskController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    ref.read(todoListProvider.notifier).add(value);
                    taskController.clear();
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Tooltip(
                        message: 'View all tasks',
                        child: CustomTextButton(
                          func: () => ref.read(todoListFilter.notifier).state =
                              TodoListFilter.all,
                          title: 'All',
                          value: TodoListFilter.all,
                        ),
                      ),
                      Tooltip(
                        message: 'View all doing tasks',
                        child: CustomTextButton(
                          func: () => ref.read(todoListFilter.notifier).state =
                              TodoListFilter.doing,
                          title: 'Doing',
                          value: TodoListFilter.doing,
                        ),
                      ),
                      Tooltip(
                        message: 'View all done tasks',
                        child: CustomTextButton(
                          func: () => ref.read(todoListFilter.notifier).state =
                              TodoListFilter.done,
                          title: 'Done',
                          value: TodoListFilter.done,
                        ),
                      ),
                      Tooltip(
                        message: 'View all favorite tasks',
                        child: CustomTextButton(
                          func: () => ref.read(todoListFilter.notifier).state =
                              TodoListFilter.favorite,
                          title: 'Favorite',
                          value: TodoListFilter.favorite,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .7,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: todos.length,
                      itemBuilder: (context, i) {
                        return Dismissible(
                          key: Key(todos[i].id),
                          onDismissed: (direction) {
                            ref
                                .read(todoListProvider.notifier)
                                .remove(todos[i]);

                            Fluttertoast.showToast(
                              msg: 'Deleted ${todos[i].description}',
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          child: ProviderScope(
                            overrides: [
                              currentTodo.overrideWithValue(todos[i]),
                            ],
                            child: const TodoItem(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
