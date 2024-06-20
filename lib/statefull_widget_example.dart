import 'package:flutter/material.dart';

class StateFullWidget extends StatefulWidget {
  const StateFullWidget({super.key});

  @override
  State<StateFullWidget> createState() => _StateFullWidgetState();
}

class _StateFullWidgetState extends State<StateFullWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Statefull'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(DateTime.now().toString()),
          Container(
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count++;
          print(count);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
