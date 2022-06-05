import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 09',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class Foo with ChangeNotifier {
  String value = 'Foo';
  void changeValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    notifyListeners();
  }
}

// ProviderNotFoundException was thrown building error
// BuildContext that does not include
// main.dart에 새로운 프로바이드를 더한 후에 핫 리로드 시킴
//  프로바이드를 읽을 수 있도록 다른 루트를 사용해라
// 빌드 컨텍스트를 이용해서 return을 받는 구조로 만들어서 사용해라(마치 위젯이 있는 거 같은 컨텍스트를 얻을 수 있음)
// consumer를 이용해서 만든다.
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider 09"),
      ),
      body: ChangeNotifierProvider<Foo>(
        create: (_) => Foo(),
        // builder: (BuildContext context, Widget? _) {
        //   return Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Text(
        //           context.watch<Foo>().value,
        //           style: const TextStyle(fontSize: 40),
        //         ),
        //         const SizedBox(height: 20.0),
        //         ElevatedButton(
        //           onPressed: () => context.read<Foo>().changeValue(),
        //           child: const Text(
        //             'Change Value',
        //             style: TextStyle(fontSize: 20.0),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // }
        child: Consumer<Foo>(
          builder: (BuildContext context, Foo foo, Widget? _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    foo.value,
                    style: const TextStyle(fontSize: 40),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () => foo.changeValue(),
                    child: const Text(
                      'Change Value',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
