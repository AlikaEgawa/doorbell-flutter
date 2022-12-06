import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void _callAPI() async {
    const String slackToken = 'xoxb-3410044109703-4377880182321-uHUYYQK64IYaEux9Hwb39Jtq';
    var slackUri = Uri.parse('https://hooks.slack.com/services/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');

    Map<String, Object> data = {
      'channel': 'slack-me',
      'text': '【要対応！】\nお客さんが来ています！！',
      'user_name': '来客通知BOT',
      'icon_emoji': 'dog',
      'link_names': 1
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

    // var response = await http.post(slackUri,
    // headers: {'Content-Type': "application/json"},
    // body: json.encode(request.toJson())
    // );
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _callAPI,
          child: const Text('Call API'),
        ),
      ),
    );
  }
}