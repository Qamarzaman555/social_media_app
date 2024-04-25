import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterController(),
      child: Consumer<CounterController>(builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter App'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: ${provider.count}'),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.counter();
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
