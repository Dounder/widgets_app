import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black12),
          SizedBox(height: 30),
          Text('Progress Indicator controlled'),
          SizedBox(height: 10),
          _ControlledCircularIndicator(),
          SizedBox(height: 30),
          Text('Linear Progress Indicator'),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: LinearProgressIndicator(backgroundColor: Colors.black12),
          ),
          SizedBox(height: 30),
          Text('Linear Indicator controlled'),
          SizedBox(height: 10),
          _ControlledLinearIndicator()
        ],
      ),
    );
  }
}

class _ControlledCircularIndicator extends StatelessWidget {
  const _ControlledCircularIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (value) => (value * 2) / 100,
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final value = snapshot.data ?? 0;
        return CircularProgressIndicator(value: value, strokeWidth: 2, backgroundColor: Colors.black12);
      },
    );
  }
}

class _ControlledLinearIndicator extends StatelessWidget {
  const _ControlledLinearIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (value) => (value * 2) / 100,
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final value = snapshot.data ?? 0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LinearProgressIndicator(value: value, backgroundColor: Colors.black12),
        );
      },
    );
  }
}
