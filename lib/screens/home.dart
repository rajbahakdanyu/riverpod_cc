import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Todo'),
      ),
      body: Column(
        children: [
          Text(
            'Todo',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
