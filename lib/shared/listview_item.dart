import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String info;
  final String price;
  final String ratings;
  final String reviews;
  final Image image;
  const ListViewItem({
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
      child: Container(
        color: Theme.of(context).accentColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(width: 110, child: image),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              info,
                              textScaleFactor: 1.1,
                            ),
                          ),
                          Text(
                            'Price: $price \$',
                            textScaleFactor: 1.1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
