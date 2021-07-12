import 'package:flutter/material.dart';
import 'package:prodify_application_task/sevices/database_services.dart';
import 'package:prodify_application_task/shared/calculate_distance.dart';
import 'package:prodify_application_task/shared/image_decoration.dart';

class InfoPage extends StatelessWidget {
  final int id;

  InfoPage({required this.id});

  DatabaseServices _databaseServices = DatabaseServices();
  CalculateDistance _calculateDistance = CalculateDistance();

  @override
  Widget build(BuildContext context) {
    print(id);

    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidht = MediaQuery.of(context).size.width;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: FutureBuilder(
          future: _databaseServices.getDish(id),
          builder: (context, AsyncSnapshot<Map?> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );

            print(snapshot.data);
            Map data = snapshot.data!;

            double mAway = _calculateDistance(
                0, 0, data["pickupLongitude"], data["pickupLatitude"]);

            bool _isOpen = data["currentStatus"] == 'OPEN';
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: statusBarHeight,
                    width: maxWidht,
                    color: Theme.of(context).accentColor,
                  ),
                  Stack(
                    children: [
                      Center(
                        child: ClipPath(
                          clipper: ImageDecoration(),
                          child: Container(
                            width: maxWidht,
                            height: 260,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                            ),
                            child: Image.asset(
                              'assets/images/sushi.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 220,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    _isOpen ? Colors.green : Colors.deepOrange,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text('${data["currentStatus"]}',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data["menuTitle"],
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${data["costPerUnit"].toInt()} kr',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          endIndent: 150,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["menuDescription"],
                          textScaleFactor: 1.7,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Ingredients:',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data["ingredients"]}',
                          textScaleFactor: 1.5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pickup Address:',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data["pickupAddress"]} \n${mAway.toInt()} m away',
                          textScaleFactor: 1.5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
