import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/res/text_style.dart';
import 'package:places/ui/components/label_text_widget.dart';

class AddSightScreen extends StatefulWidget {
  static const String routeName = '/add_sight_screen';

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

//TODO: Правильно ли я сделал этот экран? Так как клавиатура перекрывает форму.
class _AddSightScreenState extends State<AddSightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  'Отмена',
                  style: Theme.of(context).primaryTextTheme.caption,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Новое место",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            LabelWidget('категория'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Смотреть туториал',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Icon(Icons.chevron_right),
              ],
            ),
            Divider(),
            SizedBox(height: 24),
            _buildTitle(),
            SizedBox(height: 24),
            _buildCoordinate(),
            SizedBox(height: 24),
            Expanded(child: _buildDescription()),
            ElevatedButton(
              onPressed: () {
                print('on click iconGo');
              },
              child: Text(
                'Создать'.toUpperCase(),
                style: textButtonElevation,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

Widget _buildTitle() {
  return Column(
    children: [
      LabelWidget("название"),
      TextField(),
    ],
  );
}

Widget _buildDescription() {
  return Column(
    children: [
      LabelWidget("описание"),
      TextField(),
    ],
  );
}

Widget _buildCoordinate() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              children: [LabelWidget('широта'), TextField()],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [LabelWidget('долгота'), TextField()],
            ),
          )
        ],
      ),
      SizedBox(height: 16),
      Text('Указать на карте')
    ],
  );
}
