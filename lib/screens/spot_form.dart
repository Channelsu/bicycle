import 'package:flutter/material.dart';

class SpotForm extends StatefulWidget {
  @override
  _SpotFormState createState() => _SpotFormState();
}

class _SpotFormState extends State<SpotForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新しい場所の追加'),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(),
        ),
      ),
    );
  }
}