/// このコード以外のリソースを使いたいとき import 'リソースのパス'　と書きます。
/// material.dart の中には UI を作るための部品が入っていると思ってください。
import 'package:flutter/material.dart';

/// flutterではまずmain.dart　の main() が実行されます。
/// これは関数と呼ばれるものですが、関数については次のチャプターで詳しく解説します。
void main() {
  /// runApp(最初に表示させたいUI) と書くことでそのUIが画面に表示されます。
  runApp(
    // /// ここからは UI の記述です。
    // /// 画面の真ん中に 'Hello, world!' と表示させるという意味なります。
    // /// Center や Text は Widget とよばれるUI部品です。
    // /// Flutter では Widget を組み合わせることでUIを作ります。
    // const Center(
    //   child: Text(
    //     'Hello, world!',
    //     /// left to right で ltr。左から右に読む言語はこれを指定します。
    //     /// このあとのコードでは基本的にはデフォルトで ltr になるので指定しなくても大丈夫です。
    //     textDirection: TextDirection.ltr,
    //   ),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'egawadesu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 255, 255, 255),
            )
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
              TweetTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class TweetTitle extends StatelessWidget {
  const TweetTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://1.bp.blogspot.com/-VACf4WfKNOk/X-Fcx7DWraI/AAAAAAABdE8/KT0UudaIHrMtbFvjC02yLuPLNBZurGYpQCNcBGAsYHQ/s400/onepiece17_doflamingo.png'),
          ),
          const SizedBox(width:8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text('egawadesu'),
                  SizedBox(width: 8),
                  Text('2022/12/05'),
                ]
              ),
              const SizedBox(height: 4),
              const Text('サンプルです！'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ],
      ),
    );
  }
}