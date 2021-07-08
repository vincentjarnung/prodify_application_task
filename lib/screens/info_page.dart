import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final Image image;
  final String title;
  final String info;
  final String price;
  final String ratings;
  final String reviews;

  InfoPage({
    required this.title,
    required this.info,
    required this.image,
    required this.price,
    required this.ratings,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 41,
            ),
            Center(
              child: Container(
                width: maxWidht,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: image,
                ),
              ),
            ),
            Container(
              width: maxWidht,
              height: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  color: Colors.white60),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        info,
                        textScaleFactor: 1.5,
                      ),
                    ),
                    Text(
                      'Price: $price \$',
                      textScaleFactor: 1.5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
