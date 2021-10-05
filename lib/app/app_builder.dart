// App Builder
import 'package:flutter/widgets.dart';

class AppBuilder extends StatefulWidget {
  final Widget Function(BuildContext) builder;

  const AppBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  AppBuilderState createState() => AppBuilderState();

  static AppBuilderState of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>()
        as AppBuilderState;
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context);

  void rebuild() => setState(() => debugPrint('Rebuild full application'));
}
