// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/common/provider/app.dart';
import 'package:news_app/common/utils/utils.dart';
import 'package:news_app/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Column(
      children: <Widget>[
        Text('用户: ${Global.profile.displayName}'),
        Divider(),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text('退出'),
        ),
        Divider(),
        MaterialButton(
          onPressed: () {
            appState.switchGrayFilter();
          },
          child: Text('灰色切换 ${appState.isGrayFilter}'),
        ),
      ],
    );
  }
}
