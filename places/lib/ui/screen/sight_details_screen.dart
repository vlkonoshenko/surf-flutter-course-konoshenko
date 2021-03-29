import 'package:flutter/material.dart';
import 'package:places/res/res.dart';
import 'package:places/ui/components/components.dart';

class SightDetailsScreen extends StatefulWidget {
  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0.0,
              left: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Пряности и радости',
                              style: textBold24,
                            ),
                            Row(
                              children: [
                                Text(
                                  'ресторан',
                                  style: textBoldPrimary14,
                                ),
                                SizedBox(width: 16),
                                Text(
                                  'закрыто до 09:00',
                                  style: textRegularSecondary14,
                                )
                              ],
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Пряный вкус радостной жизни вместе с шеф-поваром Изо Дзандзава, благодаря которой у гостей ресторана есть возможность выбирать из двух направлений: европейского и восточного',
                              style: textRegular14,
                            )
                          ],
                        ),
                        SizedBox(height: 24),
                        BtnRaised(),
                        SizedBox(height: 24),
                        Divider(),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: BtnSecondary(
                                  title: 'Запланировать',
                                )),
                            Expanded(
                                flex: 1,
                                child: BtnSecondary(
                                  title: 'В Избранное',
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(),
          ),
        ],
      ),
    );
  }
}
