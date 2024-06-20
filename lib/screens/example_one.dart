import 'package:flutter/material.dart';
import 'package:learn_provider_1/provider/example_one_provider.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Provider"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<ExampleOneProvider>(builder: (context, value, child) {
          return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                value.setValue(val);
              });
        }),
        Consumer<ExampleOneProvider>(builder: (context, value, child) {
          return  Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(value.value)),
                child: const Center(
                  child: Text("Contnair 1"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(value.value)),
                child: const Center(
                  child: Text("Contnair 2"),
                ),
              ),
            ),
          ],
        );
        }),
       
      ]),
    );
  }
}
