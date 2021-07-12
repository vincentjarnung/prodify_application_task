import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final VoidCallback onTap;
  final String type;
  final String title;
  final String info;
  final double price;
  final double mAway;

  final String imageDir;
  const ListViewItem(
      {Key? key,
      required this.onTap,
      required this.type,
      required this.title,
      required this.info,
      required this.imageDir,
      required this.price,
      required this.mAway})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 350,
        color: Theme.of(context).accentColor,
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: maxWidth,
                  child: Image.asset(
                    'assets/images/sushi.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    width: maxWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$title | $type',
                            textScaleFactor: 1.3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Price: ${price.toInt()} sek',
                              textScaleFactor: 1.2,
                            ),
                          ),
                          Text(
                            info,
                            textScaleFactor: 1.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Resturant is ${mAway.toInt()}m away',
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
