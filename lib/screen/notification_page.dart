import 'package:flutter/material.dart';
import 'package:jupViec/widget/backgroundColor.dart';
import 'package:jupViec/widget/gradientColor.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notification"),
        centerTitle: true,
        flexibleSpace: backgroundColor(
            child: Container(color: Colors.white),
            colors: GradientColor.primaryGradient),
      ),
    );
  }
}
