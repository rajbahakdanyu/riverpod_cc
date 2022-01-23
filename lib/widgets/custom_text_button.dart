import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constant.dart';
import '/screens/home.dart';

class CustomTextButton extends ConsumerWidget {
  const CustomTextButton({
    Key? key,
    required this.func,
    required this.title,
    required this.value,
  }) : super(key: key);

  final VoidCallback func;
  final String title;
  final TodoListFilter value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(todoListFilter);

    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: func,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 18,
              fontWeight: value == activeFilter ? FontWeight.bold : null,
              color: value == activeFilter
                  ? Colors.purple
                  : Colors.purple.shade300,
            ),
      ),
    );
  }
}
