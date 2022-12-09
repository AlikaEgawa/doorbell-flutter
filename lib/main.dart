import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'next_page.dart';

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

  void _callAPI() async {
    const String slackToken = 'xoxb-3410044109703-4377880182321-URa5iL6oRRbchpjSdZX1LywH';
    var slackUri = Uri.parse('https://hooks.slack.com/services/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');

    Map<String, Object> data = {
      'blocks': [
        {
          "type": "header",
          "text": {
            "type": "plain_text",
            "text": "要対応!",
            "emoji": true
          }
        },
        {
          'type': "section",
          'text': {
            'type': 'mrkdwn',
            'text': '玄関にお客さんが来ています!! :man-running: :dash: :dash: :dash: @here'
          }
        },
      ]
    };

    final http.Response response = await http.post(
      slackUri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $slackToken",
      },
      body: json.encode(data)
    );
    print(response);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

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
                    MaterialPageRoute(builder: (context) => SecondRoute())
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