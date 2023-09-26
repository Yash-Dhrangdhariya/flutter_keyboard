import 'package:flutter/material.dart';
import 'package:flutter_keyboard/components/keyboard_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode numberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    numberFocusNode.addListener(() {
      bool hasFocus = numberFocusNode.hasFocus;
      if (hasFocus) {
        KeyboardOverlay.showOverlay(context);
      } else {
        KeyboardOverlay.removeOverlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: const ColoredBox(
              color: Colors.yellow,
            ),
          ),
          // TextField(
          //   keyboardType: const TextInputType.numberWithOptions(
          //       signed: true, decimal: true),
          //   maxLength: 10,
          //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // ),
          TextField(
            focusNode: numberFocusNode,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: numberFocusNode.hasFocus ? 52 : 0,
              ),
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (_, index) => ListTile(
                  tileColor: Colors.blue.shade300,
                  title: Text('$index'),
                ),
                separatorBuilder: (_, __) => const SizedBox(
                  height: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
