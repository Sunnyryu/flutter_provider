import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({Key? key}) : super(key: key);

  @override
  State<HandleDialogPage> createState() => _HandleDialogPageState();
}

class _HandleDialogPageState extends State<HandleDialogPage> {
  @override
  void initState() {
    super.initState();
    // dialog은 overlay widget이고 다른 위젯 위에 쓰이는 건데 다른 위젯이 빌드가 되지 않은 상황에서 쓴다? 당연히 안되겠죠?
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const AlertDialog(
    //         content: Text('Be careful!'),
    //       );
    //     });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Be careful!'),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (context.read<Counter>().counter == 3) {
    //   // setstateor markNeedsBuild error
    //   // 그리고 있는데 왜 왜 요청하는 것인가!
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     showDialog(
    //         context: context,
    //         builder: (context) {
    //           return const AlertDialog(
    //             content: Text('Be careful!'),
    //           );
    //         });
    //   });
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Handle Dialog'),
      ),
      body: Center(
        child: Text(
          '${context.watch<Counter>().counter}',
          // 여기서 context.read를 쓰면 반응하지 않다..
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().increment();
        },
      ),
    );
  }
}
