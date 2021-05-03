import 'package:bicycle/screens/info_detail.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  List<Map<String, String>> infos = [
    {
      'title': 'リリースのお知らせ',
      'body': '新しくリリースしました！',
    },
    {
      'title': '不具合修正のお知らせ',
      'body': '不具合を直しました！',
    },
    {
      'title': 'V2リリースのお知らせ',
      'body': 'V2をリリースしました！',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: infos.length,
      separatorBuilder: (context, index) => Divider(color: Colors.black,),
      itemBuilder: (BuildContext context, int index) {
        final info = infos[index];
        return ListTile(
          title: Text(info['title']),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoDetail(
                  title: info['title'],
                  body: info['body'],
                )
              )
            );
          },
        );
      },
    );
  }
}