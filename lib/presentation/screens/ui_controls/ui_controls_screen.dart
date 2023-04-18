import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDev = true;
  Transportation selectedTransportation = Transportation.car;
  bool breakFast = false;
  bool lunch = false;
  bool dinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDev,
          title: const Text('Developer mode'),
          subtitle: const Text('Additional controls'),
          onChanged: (value) => setState(() => isDev = !isDev),
        ),
        ExpansionTile(
          title: const Text('Transportation'),
          subtitle: const Text('Choose your transportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Travel by car.'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('Travel by plane.'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.plane),
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Travel by boat.'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.boat),
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('Travel by submarine.'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.submarine),
            ),
          ],
        ),
        CheckboxListTile(
          value: breakFast,
          onChanged: (value) => setState(() => breakFast = !breakFast),
          title: const Text('Breakfast'),
        ),
        CheckboxListTile(
          value: lunch,
          onChanged: (value) => setState(() => lunch = !lunch),
          title: const Text('Lunch'),
        ),
        CheckboxListTile(
          value: dinner,
          onChanged: (value) => setState(() => dinner = !dinner),
          title: const Text('Dinner'),
        ),
      ],
    );
  }
}
