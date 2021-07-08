import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String info;
  final String price;
  final String ratings;
  final String reviews;
  final Image image;
  const GridViewItem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.info,
    required this.image,
    required this.price,
    required this.ratings,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        margin: EdgeInsets.all(2),
        child: Container(
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              textScaleFactor: 1.1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  ratings,
                                  textScaleFactor: 0.9,
                                ),
                                Text(
                                  '($reviews)',
                                  textScaleFactor: 0.8,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        info,
                        textScaleFactor: 0.9,
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Price: $price \$',
                          textScaleFactor: 0.9,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
