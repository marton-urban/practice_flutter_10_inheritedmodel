import 'package:flutter/material.dart';
import '/widget/state_widget.dart';
import '/widget/button_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late final MyTextField myTextField;

  @override
  void initState() {
    super.initState();
    myTextField = MyTextField(setStringCounter);
  }

  void increment() {
    StateInheritedModel.of(context).incrementCounter();
    Navigator.pop(context);
  }

  void setStringCounter() {
    final counter = int.tryParse(myTextField.value);
    StateInheritedModel.of(context).setCounter(counter!);
    Navigator.pop(context);
  }

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
              child: myTextField,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Update Counter',
              onClicked: setStringCounter,
            ),
            const SizedBox(height: 64),
            ButtonWidget(
              text: 'Increment Counter',
              onClicked: increment,
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  MyTextField(
    this.setStringCounter, {
    super.key,
  });

  final void Function() setStringCounter;

  final controller = TextEditingController();

  String get value => controller.text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onEditingComplete: setStringCounter,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
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
  }
}
