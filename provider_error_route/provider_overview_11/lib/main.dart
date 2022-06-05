import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 11',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeNotifierProvider<Counter>(
          create: (_) => Counter(),
          // context가 아닌 _로 바꾸어 돌보지 않는다구요!
          child:
              // ChildWidget(),
              Builder(
            // 빌더콜백이 아닌 빌더위젯사용 => 빌더위젯에 빌더콜백에 전달되는 context는 빌더자체의 콘텍스트, changenotifierprovider가 위에 있어서 찾을 수있음
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${context.watch<Counter>().counter}',
                    style: const TextStyle(fontSize: 48.0),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: const Text(
                      'Increment',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      context.read<Counter>().increment();
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${context.watch<Counter>().counter}',
          style: const TextStyle(fontSize: 48.0),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          child: const Text(
            'Increment',
            style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
            context.read<Counter>().increment();
          },
        )
      ],
    );
  }
}
