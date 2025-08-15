import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/providers/counter.dart';

class TestView extends ConsumerWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final counterController = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("test view"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("state: $counter"),
            TextButton(
              onPressed: () {
                counterController.increment();
              },
              child: Text('increment'),
            ),
            TextButton(
              onPressed: () {
                counterController.decrement();
              },
              child: Text('decrement'),
            ),
            TextButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              child: Text('invalidate provider'),
            ),
          ],
        ),
      ),
    );
  }
}
