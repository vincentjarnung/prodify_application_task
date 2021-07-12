import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/info_page.dart';
import 'package:prodify_application_task/sevices/database_services.dart';
import 'package:prodify_application_task/shared/calculate_distance.dart';
import 'package:prodify_application_task/shared/listview_item.dart';

class AllView extends StatefulWidget {
  const AllView({Key? key}) : super(key: key);

  @override
  _AllViewState createState() => _AllViewState();
}

class _AllViewState extends State<AllView> {
  final DatabaseServices _databaseServices = DatabaseServices();
  CalculateDistance _calculateDistance = CalculateDistance();

  List<Widget> _snacksList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseServices.getAll(),
      builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        _snacksList.clear();

        snapshot.data!
            .where((element) => element["menuTitle"] == 'Snacks')
            .forEach((item) {
          _snacksList.add(
            ListViewItem(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      id: item["id"],
                    ),
                  ),
                );
              },
              type: item["menuTitle"],
              title: item["menuDescription"],
              info: item["pickupAddress"],
              imageDir: item["photosDirectory"],
              price: item["costPerUnit"],
              mAway: _calculateDistance(
                0,
                0,
                item["pickupLongitude"],
                item["pickupLongitude"],
              ),
            ),
          );
        });

        snapshot.data!
            .where((element) => element["menuTitle"] == 'Main Course')
            .forEach((item) {
          _snacksList.add(
            ListViewItem(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      id: item["id"],
                    ),
                  ),
                );
              },
              type: item["menuTitle"],
              title: item["menuDescription"],
              info: item["pickupAddress"],
              imageDir: item["photosDirectory"],
              price: item["costPerUnit"],
              mAway: _calculateDistance(
                0,
                0,
                item["pickupLongitude"],
                item["pickupLongitude"],
              ),
            ),
          );
        });

        snapshot.data!
            .where((element) => element["menuTitle"] == 'Dessert')
            .forEach((item) {
          _snacksList.add(
            ListViewItem(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InfoPage(
                      id: item["id"],
                    ),
                  ),
                );
              },
              type: item["menuTitle"],
              title: item["menuDescription"],
              info: item["pickupAddress"],
              imageDir: item["photosDirectory"],
              price: item["costPerUnit"],
              mAway: _calculateDistance(
                0,
                0,
                item["pickupLongitude"],
                item["pickupLongitude"],
              ),
            ),
          );
        });

        return Container(
          color: Colors.grey[200],
          child: ListView.builder(
            itemCount: _snacksList.length,
            itemBuilder: (context, index) {
              return _snacksList[index];
            },
          ),
        );
      },
    );
  }
}