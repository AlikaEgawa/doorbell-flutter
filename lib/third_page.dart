import 'package:flutter/material.dart';
import 'package:ipadflutter/main.dart';

// ignore: use_key_in_widget_constructors
class ThirdRoute extends StatelessWidget {
  // const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('送信完了'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text('呼び出し中です。お掛けになってお待ちください'),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp())
                );
              },
              child: const Text('TOPへ戻る'),
            )
          ],
        ),
      )
    );
  }
  
}