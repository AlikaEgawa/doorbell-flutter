import 'package:flutter/material.dart';
import 'package:ipadflutter/third_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class NextPage extends StatelessWidget {
  final String name;
  final String content;
  const NextPage(this.name, this.content, {super.key});

  static String webhookURL = "https://hooks.slack.com/services/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";

  void _callAPI() async {
    const String slackToken = "xoxb-3614675099-4848667389216-LQBkheBpOfr2egTMiUVbXgXu";
    var slackUri = Uri.parse(webhookURL);

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
              "text": "*来客された方:*\n$nameさん"
            },
            {
              "type": "mrkdwn",
              "text": "*要件:*\n$content"
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
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('確認'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 400, 30),
                  child: Text(
                    'お名前',
                    style: 
                      TextStyle(
                        fontSize: 30,
                      ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    '$nameさま',
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 400, 10),
                  child: Text(
                    'ご用件',
                    style: TextStyle(
                      fontSize: 30
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 35,
                    ),
                  ),
                )
              ],
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(300, 100, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: () {
                      _callAPI();
                      FocusScope.of(context).unfocus();
                        Navigator.push(
                          context,
                            MaterialPageRoute(
                              builder: (context) => ThirdRoute())
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      '呼び出す',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ),
              ),
          ],
        )
      ),
    );
  }
  
}