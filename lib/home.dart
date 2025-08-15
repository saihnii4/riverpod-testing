import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/providers/counter.dart';
import 'package:riverpod_testing/test_view.dart';

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
            Text(
              "state: $counter",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
            ),
            TextButton(
              child: Text(
                "open other view",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TestView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
