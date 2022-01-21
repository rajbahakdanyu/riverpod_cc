import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/widgets/custom_text_button.dart';

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
      body: SingleChildScrollView(
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
                height: MediaQuery.of(context).size.height * .65,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, i) {
                      return const Text('data');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
