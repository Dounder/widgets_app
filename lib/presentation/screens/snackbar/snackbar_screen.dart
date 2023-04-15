import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({Key? key}) : super(key: key);

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Anim nostrud laborum'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'Elit tempor veniam laborum sunt aute laboris. Et nulla esse non nulla culpa dolore do. Et qui duis in nisi aliqua eu do excepteur voluptate consectetur proident.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Accept')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialogs and Snackbars')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(
                context: context,
                children: const [
                  Text(
                    'Elit tempor veniam laborum sunt aute laboris. Et nulla esse non nulla culpa dolore do. Et qui duis in nisi aliqua eu do excepteur voluptate consectetur proident.',
                  ),
                ],
              ),
              child: const Text('Used licences'),
            ),
            FilledButton.tonal(onPressed: () => openDialog(context), child: const Text('Show screen dialog')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
