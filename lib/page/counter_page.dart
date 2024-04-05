import 'package:flutter/material.dart';
import '/widget/state_widget.dart';
import '/widget/button_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              child: buildTextField(onSubmitted: setCounter),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Update Counter',
              onClicked: () => setCounter(controller.text),
            ),
            const SizedBox(height: 64),
            ButtonWidget(
              text: 'Increment Counter',
              onClicked: incrementCounter,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required ValueChanged<String> onSubmitted,
  }) =>
      TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: 'Counter',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
          hintStyle: const TextStyle(color: Colors.white70),
        ),
      );

  void incrementCounter() {
    final provider = StateInheritedModel.of(context);
    provider.incrementCounter();

    Navigator.pop(context);
  }

  void setCounter(String value) {
    final counter = int.tryParse(value);
    final provider = StateInheritedModel.of(context);
    provider.setCounter(counter!);

    Navigator.pop(context);
  }
}
