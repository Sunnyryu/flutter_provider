import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: "dog08", breed: "Dogbreed", age: 3),
      child: MaterialApp(
        title: 'Provider 08',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Provider 08'),
        ),
        // 사용하지않으면 _ 처리
        body: Selector<Dog, String>(
          // 앞에는 여러개의 프로퍼티를 가지는 오브젝트의 타입  뒤에는 그 중에서 사용할 프로퍼티의 타입
          selector: (BuildContext context, Dog dog) => dog.name,

          builder: (BuildContext context, String name, Widget? child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  child!,
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '- name: $name',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 10.0),
                  const BreedAndAge(),
                ],
              ),
            );
          },
          // rebuild 시키고 싶지 않을 때 쓰면 좋습니다.! child라는 친구를
          child: const Text(
            "I like dogs very much",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, String>(
        selector: (BuildContext context, Dog dog) => dog.breed,
        builder: (_, String breed, __) {
          return Column(
            children: [
              Text(
                '- breed: $breed',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 10.0),
              const Age(),
            ],
          );
        });
  }
}

class Age extends StatelessWidget {
  const Age({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Dog, int>(
        selector: (BuildContext context, Dog dog) => dog.age,
        builder: (_, int age, __) {
          return Column(
            children: [
              Text(
                '- age: $age',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => context.read<Dog>().grow(),
                child: const Text(
                  'Grow',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          );
        });
  }
}
// Consumer를 여러번 쓰게되면 뭔가 애매한거 같음
// Provider.of와 관련없는 친구가 있다면... 다시 빌드가 되는 일이 발생함