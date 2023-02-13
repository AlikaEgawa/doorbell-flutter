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
        // appBar: AppBar(
        //   title: const Text('ECN受付システム'),
        //   centerTitle: true,
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text(
                    'ECNへようこそ',
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    '御用の方は要件を入力し\n「次へ」をタップしてください',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 80.0,
                ),
                child: Column(
                  children:  <Widget>[
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 400, 10),
                      child: Text(
                        'お名前',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        onChanged: (text) {
                          nameText = text;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "例）○○エンジニアリング　田中太郎",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 400, 10),
                      child: Text(
                        'ご用件',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 500,
                      child: TextField(
                        onChanged: (value) {
                          conText = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "例）打ち合わせ",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(300, 48, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: () { 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage(nameText, conText)),
                      );
                    },
                    child: const Text(
                      '次へ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

