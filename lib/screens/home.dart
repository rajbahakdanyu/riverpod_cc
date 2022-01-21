import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DefaultTabController(
            length: 4,
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
                  child: TabBar(
                    labelColor: Colors.deepPurple,
                    labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                    tabs: const [
                      Text('All'),
                      Text('Doing'),
                      Text('Done'),
                      Text('Favorite'),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .7,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Text('All'),
                        Text('Doing'),
                        Text('Done'),
                        Text('Favorite'),
                      ],
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
