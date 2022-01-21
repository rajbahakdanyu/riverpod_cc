import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}
