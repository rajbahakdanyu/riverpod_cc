import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/widgets/custom_text_button.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController taskController = TextEditingController();

  String selectedTab = 'All';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                      func: () {},
                      title: 'All',
                    ),
                    CustomTextButton(
                      func: () {},
                      title: 'Doing',
                    ),
                    CustomTextButton(
                      func: () {},
                      title: 'Done',
                    ),
                    CustomTextButton(
                      func: () {},
                      title: 'Favorite',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .7,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
