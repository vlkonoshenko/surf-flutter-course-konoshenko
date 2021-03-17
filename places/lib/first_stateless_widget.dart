import 'package:flutter/material.dart';

class MyFirstWidget extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    counter = counter + 1;
    print(counter);
    return Container(
      child: Center(
        child: Text('Hello!'), //build вызывается один раз при создании виджета
      ),
    );
  }

// Type getContextRuntime(){
//    return context.runtimeType;
// }
}
