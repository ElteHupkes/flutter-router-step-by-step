import 'package:flutter/material.dart';
import 'package:router_step_by_step/app_state.dart';

class WelcomeScreen extends StatelessWidget {
  final StateUpdater update;

  const WelcomeScreen({Key? key, required this.update}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Welcome to my app!"),
          const SizedBox(width: double.infinity, height: 16),
          ElevatedButton(
            onPressed: () => update(const AppState(showPosts: true)),
            child: const Text("Show posts"),
          )
        ],
      ),
    );
  }
}
