import 'package:flutter/material.dart';

import 'second_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final double devideHeight = MediaQuery.of(context).size.height; //デバイスサイズを定義
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Door Bell App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              const Text('ECNへようこそ'),
              const Text('御用の方は「呼び出す」をタッチしてください'),
              // const TextField(),
              ElevatedButton(
                onPressed: (){
                  // FocusScope.of(context).unfocus();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRoute())
                  );
                },
                child: const Text('呼び出す')
              ),
              // ElevatedButton(onPressed: _callAPI, child: const Text('Call API'))
            ],
          ),
        ),
      ),
    );
  }
}