import 'package:flutter/material.dart';

class SpotForm extends StatefulWidget {
  @override
  _SpotFormState createState() => _SpotFormState();
}

class _SpotFormState extends State<SpotForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _spotName;

  Widget _buildSpotName() {
    return TextFormField(
      decoration: InputDecoration(labelText: '駐輪所名',),
      maxLength: 20,
      validator: (String value) {
        if(value.isEmpty) {
          return '必須入力です';
        }
        return null;
      },
      onSaved: (String value) {
        _spotName = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新しい場所の追加'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            // 縦を基準として中央に配置
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildSpotName(),
              SizedBox(height: 100,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text('投稿', style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                child: Text('キャンセル', style: TextStyle(fontSize: 20),),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}