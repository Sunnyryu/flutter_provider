import 'package:flutter/material.dart';
import 'package:provider_overview_13/counter.dart';
import 'package:provider/provider.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          style: const TextStyle(
            fontSize: 52.0,
          ),
        ),
      ),
    );
  }
}
