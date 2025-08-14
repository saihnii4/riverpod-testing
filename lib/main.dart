import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/home.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Riverpod Testing',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeView(),
      ),
    ),
  );
}
