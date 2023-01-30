// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ipadflutter/third_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: use_key_in_widget_constructors
class SecondRoute extends StatelessWidget {
  // const SecondRoute({super.key});

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
        {
          "type": "section",
          "fields": [
            {
              "type": "mrkdwn",
              "text": "*来客された方:*\n江川さん"
            },
            {
              "type": "mrkdwn",
              "text": "*要件:*\n打ち合わせ"
            }
          ]
        }
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
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Door Bell App'),
          centerTitle: true,
        ),
        body: SizedBox(
          height: double.infinity,
          // color: Colors.red,
          child: Center(
            child: Column(
              children: [
                const Text('ボタンを押すと呼び出しします'),
                Column(
                  children: [
                    const Text('お名前'),
                    const TextField(),
                    const Text('ご用件'),
                    const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        _callAPI();
                        FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdRoute())
                        );
                      },
                    child: const Text('呼び出す')
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
  
}