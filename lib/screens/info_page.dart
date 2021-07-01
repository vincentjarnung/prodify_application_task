import 'package:flutter/material.dart';
import 'package:prodify_application_task/shared/wavy_bottom.dart';

class InfoPage extends StatelessWidget {
  final String num;

  InfoPage({required this.num});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: ClipPath(
          clipper: WavyBottom(level: 10),
          child: AppBar(
            centerTitle: true,
            title: Text(
              'Item number $num',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
