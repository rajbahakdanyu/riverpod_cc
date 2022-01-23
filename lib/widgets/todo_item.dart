import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/screens/home.dart';

class TodoItem extends ConsumerWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);

    return ListTile(
      leading: Tooltip(
        message: 'Mark a task as done/doing',
        child: Checkbox(
          value: todo.completed,
          onChanged: (value) =>
              ref.read(todoListProvider.notifier).toggleComplete(
                    todo.id,
                  ),
        ),
      ),
      title: Text(todo.description),
      trailing: Tooltip(
        message: 'Favorite a task',
        child: IconButton(
          onPressed: () {
            ref.read(todoListProvider.notifier).toggleFavorite(
                  todo.id,
                );
          },
          icon: Icon(
            todo.favorited ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        ),
      ),
      horizontalTitleGap: 4,
    );
  }
}
