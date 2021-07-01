import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/info_page.dart';
import 'package:prodify_application_task/shared/wavy_bottom.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<Widget> _list = [];
  bool _isListView = true;

  @override
  Widget build(BuildContext context) {
    _list.clear();
    // Creates a simple list until I know what items I will have init
    for (int i = 1; i < 11; i++) {
      _list.add(
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InfoPage(num: '$i'),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              height: 70,
              child: Center(
                child: Text(i.toString()),
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipPath(
          clipper: WavyBottom(level: 10),
          child: AppBar(
            centerTitle: true,
            title: Text(
              'Items',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isListView = !_isListView;
                    });
                  },
                  icon: Icon(
                    Icons.grid_view,
                    color: !_isListView
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isListView = !_isListView;
                    });
                  },
                  icon: Icon(
                    Icons.list,
                    color: _isListView
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: _isListView
                  ? ListView(
                      children: _list,
                    )
                  : GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: _list,
                    ))
        ],
      ),
    );
  }
}
