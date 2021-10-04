import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final helloWorldProvider = Provider<String>((ref) {
  return "Hello Riverpod";
});

void main() {
  // For widgets to be able to read providers, we need to wrap the entire
  // application in a "ProviderScope" widget.
  // This is where the state of our providers will be stored.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Example')),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
