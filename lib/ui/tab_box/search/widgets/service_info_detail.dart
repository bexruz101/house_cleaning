import 'package:flutter/material.dart';

class ServiceInfoDetail extends StatelessWidget {
  const ServiceInfoDetail(
      {super.key,
      required this.desc,
      required this.image,
      required this.video});

  final String desc;
  final String image;
  final String video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'saloom',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [Text(image), Text(video), Text(desc)],
        ),
      ),
    );
  }
}
