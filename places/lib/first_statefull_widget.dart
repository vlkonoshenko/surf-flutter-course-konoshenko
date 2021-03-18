import 'package:flutter/material.dart';

class MyFirstStatefulWidget extends StatefulWidget {
  @override
  _MyFirstStatefulWidgetState createState() => _MyFirstStatefulWidgetState();
}

class _MyFirstStatefulWidgetState extends State<MyFirstStatefulWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    counter = counter + 1; //если убрать строку изменения состояния, то виджет не будет вызывать билд каждый раз
    print(counter);
    return Container(
      child: Center(
        child: Text(
            'Hello!'), //build выполняется каждый раз так как меняется состояние.
      ),
    );
  }
}
