import 'package:flutter/material.dart';
import 'next_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECN 受付アプリ',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static String nameText = '';
  static String conText = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ECN受付システム'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text('ECNへようこそ'),
                  Text('御用の方は要件を入力し「次へ」をタッチしてください'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children:  <Widget>[
                    const Text('お名前'),
                    TextField(
                      onChanged: (text) {
                        nameText = text;
                      },
                    ),
                    const Text('ご用件'),
                    TextField(
                      onChanged: (value) {
                        conText = value;
                      },
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NextPage(nameText, conText)),
                  );
                },
                child: const Text('次へ')
              ),
            ],
          ),
        ),
      ),
    );
  }
}

