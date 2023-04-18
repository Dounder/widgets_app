import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';

  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards screen')),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) => _CardTypeOne(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) => _CardTypeTwo(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) => _CardTypeThree(label: card['label'], elevation: card['elevation'])),
          ...cards.map((card) => _CardTypeFour(label: card['label'], elevation: card['elevation'])),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

class _CardTypeOne extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeOne({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            ),
            Align(alignment: Alignment.topLeft, child: Text(label))
          ],
        ),
      ),
    );
  }
}

class _CardTypeTwo extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeTwo({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: colors.outline),
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            ),
            Align(alignment: Alignment.topLeft, child: Text('$label - outline'))
          ],
        ),
      ),
    );
  }
}

class _CardTypeThree extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeThree({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            ),
            Align(alignment: Alignment.topLeft, child: Text('$label - Filled'))
          ],
        ),
      ),
    );
  }
}

class _CardTypeFour extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardTypeFour({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/250',
            height: 250,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
            ),
          )
        ],
      ),
    );
  }
}
