import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/providers/counter.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  _HomeViewState();

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    final counterController = ref.read(counterProvider.notifier);

    ref.listen(counterProvider, (prev, curr) {
      debugPrint("state change: $prev, $curr");
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("riverpod testing"),
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
