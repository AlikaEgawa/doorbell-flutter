import 'package:flutter/material.dart';
import 'package:ipadflutter/second_page.dart';

// ignore: use_key_in_widget_constructors
class ThirdRoute extends StatelessWidget {
  // const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Door Bell App'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              // FocusScope.of(context).unfocus();
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute())
              );
            },
          child: const Text('this is third')
          ),
        ),
      ),
    );
  }
  
}