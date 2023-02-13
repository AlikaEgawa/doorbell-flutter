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
                Text(
                  '呼び出し中です。\nお掛けになってお待ちください',
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(300, 40, 0, 0),
              child: SizedBox(
                width: 200,
                height: 62,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.grey,
                    ),
                  child: const Text(
                    'TOPへ戻る',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  
}