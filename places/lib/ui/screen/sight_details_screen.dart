import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/res/res.dart';

class SightDetailsScreen extends StatefulWidget {
  @override
  _SightDetailsScreenState createState() => _SightDetailsScreenState();
}

class _SightDetailsScreenState extends State<SightDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 360,
                  color: Colors.red,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: _btnBack(),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                children: [
                  _buildContent(),
                  SizedBox(height: 24),
                  _btnBuildRoute(),
                  SizedBox(height: 24),
                  Divider(),
                  SizedBox(height: 8),
                  _btnFooter()
                ],
              ),
            )
          ],
        ));
  }

  Row _btnFooter() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 24,
                  width: 24,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text(
                  'Запланировать',
                  style: textRegularSecondary14,
                )
              ],
            )),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 24,
                  width: 24,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text(
                  'В Избранное',
                  style: textRegular14,
                )
              ],
            ))
      ],
    );
  }

  Widget _btnBuildRoute() {
    return Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 24,
              width: 24,
              color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              'Построить маршрут'.toUpperCase(),
              style: textButton,
            ),
          ],
        ));
  }

  Widget _btnBack() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 32,
      width: 32,
      child: Icon(
        Icons.arrow_back_ios_outlined,
        size: 12,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
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
    );
  }
}
