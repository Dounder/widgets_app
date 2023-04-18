import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clicks = ref.watch(counterProvider);
    final bool isDark = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () => ref.read(isDarkModeProvider.notifier).update((darkMode) => !darkMode),
          ),
        ],
      ),
      body: Center(
        child: Text('Value: $clicks', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => ref.read(counterProvider.notifier).state++,
      ),
    );
  }
}
