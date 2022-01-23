import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/todo.dart';
import '/widgets/custom_text_button.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(id: '1', description: 'Take a shower'),
    Todo(id: '2', description: 'Bathe the dogs'),
    Todo(id: '3', description: 'Go grocery shopping'),
  ]);
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController taskController = TextEditingController();
  String selectedTab = 'All';

  @override
  Widget build(BuildContext context) {
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
                  onFieldSubmitted: (value) {},
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextButton(
                        func: () {
                          setState(() {
                            selectedTab = 'All';
                          });
                        },
                        title: 'All',
                        value: selectedTab,
                      ),
                      CustomTextButton(
                        func: () {
                          setState(() {
                            selectedTab = 'Doing';
                          });
                        },
                        title: 'Doing',
                        value: selectedTab,
                      ),
                      CustomTextButton(
                        func: () {
                          setState(() {
                            selectedTab = 'Done';
                          });
                        },
                        title: 'Done',
                        value: selectedTab,
                      ),
                      CustomTextButton(
                        func: () {
                          setState(() {
                            selectedTab = 'Favorite';
                          });
                        },
                        title: 'Favorite',
                        value: selectedTab,
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
                      itemCount: 30,
                      itemBuilder: (context, i) {
                        return Dismissible(
                          key: Key(i.toString()),
                          onDismissed: (direction) {},
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
                          child: ListTile(
                            leading: const Icon(Icons.check_box_outlined),
                            title: const Text('Task'),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.star_border),
                            ),
                            onTap: () {},
                            horizontalTitleGap: 4,
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
