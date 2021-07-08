import 'package:flutter/material.dart';
import 'package:prodify_application_task/screens/authentication/auth_page.dart';
import 'package:prodify_application_task/screens/info_page.dart';
import 'package:prodify_application_task/sevices/auth_services.dart';
import 'package:prodify_application_task/shared/gridview_item.dart';
import 'package:prodify_application_task/shared/listview_item.dart';
import 'package:prodify_application_task/shared/rounded_button.dart';
import 'package:prodify_application_task/shared/wavy_bottom.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthServices _authServices = AuthServices();
  List<Map> data = [
    {
      'category': 'Pizza',
      'title': 'Margarita',
      'info': 'Tomato Sauce, Mozarella',
      'price': '9',
      'rating': '4.1',
      'reviewers': '19'
    },
    {
      'category': 'Pizza',
      'title': 'Vesuvio',
      'info': 'Tomato Sauce, Mozarella, Ham',
      'price': '10',
      'rating': '3.9',
      'reviewers': '13'
    },
    {
      'category': 'Pizza',
      'title': 'Peperoni',
      'info': 'Tomato Sauce, Mozarella, Peperoni',
      'price': '11',
      'rating': '4.0',
      'reviewers': '32'
    },
    {
      'category': 'Pizza',
      'title': 'Funghi',
      'info': 'Tomato Sauce, Mozarella, Mushroom',
      'price': '10',
      'rating': '4.2',
      'reviewers': '33'
    },
    {
      'category': 'Pizza',
      'title': 'Vegetarian',
      'info': 'Tomato Sauce, Mozarella, Mushroom, Paprika',
      'price': '11',
      'rating': '4.4',
      'reviewers': '24'
    },
    {
      'category': 'Sushi',
      'title': '10 Pieces',
      'info': '5 Maki, 5 Nigiri',
      'price': '9',
      'rating': '3.9',
      'reviewers': '25'
    },
    {
      'category': 'Sushi',
      'title': '12 Pieces',
      'info': '6 Maki, 6 Nigiri',
      'price': '10',
      'rating': '4.0',
      'reviewers': '29'
    },
    {
      'category': 'Sushi',
      'title': '14 Pieces',
      'info': '8 Maki, 6 Nigiri',
      'price': '12',
      'rating': '3.9',
      'reviewers': '21'
    },
    {
      'category': 'Sushi',
      'title': '20 Pieces',
      'info': '10 Maki, 10 Nigiri',
      'price': '16',
      'rating': '4.1',
      'reviewers': '18'
    },
    {
      'category': 'Sushi',
      'title': '30 Pieces',
      'info': '15 Maki, 15 Nigiri',
      'price': '25',
      'rating': '4.3',
      'reviewers': '12'
    },
  ];
  List<Widget> _list = [];
  List<Widget> _grid = [];
  List<Widget> _categories = [];
  bool _isListView = true;

  @override
  Widget build(BuildContext context) {
    _list.clear();
    _grid.clear();

    // Creates a simple list until I know what items I will have init
    _categories.add(
      Container(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          title: Text(
            'Pizzas',
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    _categories.add(
      Container(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          title: Text(
            'Sushi',
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    _list.add(_categories[0]);
    for (var item in data.where((element) => element['category'] == 'Pizza')) {
      _list.add(
        ListViewItem(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  title: item['title'],
                  info: item['info'],
                  image: Image(
                    image: AssetImage(
                        'assets/images/${item['category'].toString().toLowerCase()}.png'),
                  ),
                  price: item['price'],
                  ratings: item['rating'],
                  reviews: item['reviewers'],
                ),
              ),
            );
          },
          title: item['title'],
          info: item['info'],
          image: Image(
            image: AssetImage(
                'assets/images/${item['category'].toString().toLowerCase()}.png'),
          ),
          price: item['price'],
          ratings: item['rating'],
          reviews: item['reviewers'],
        ),
      );
      _grid.add(
        GridViewItem(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  title: item['title'],
                  info: item['info'],
                  image: Image(
                    image: AssetImage(
                        'assets/images/${item['category'].toString().toLowerCase()}.png'),
                  ),
                  price: item['price'],
                  ratings: item['rating'],
                  reviews: item['reviewers'],
                ),
              ),
            );
          },
          title: item['title'],
          info: item['info'],
          image: Image(
            image: AssetImage(
                'assets/images/${item['category'].toString().toLowerCase()}.png'),
          ),
          price: item['price'],
          ratings: item['rating'],
          reviews: item['reviewers'],
        ),
      );
    }
    _list.add(_categories[1]);
    for (var item in data.where((element) => element['category'] == 'Sushi')) {
      _list.add(
        ListViewItem(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  title: item['title'],
                  info: item['info'],
                  image: Image(
                    image: AssetImage(
                        'assets/images/${item['category'].toString().toLowerCase()}.png'),
                  ),
                  price: item['price'],
                  ratings: item['rating'],
                  reviews: item['reviewers'],
                ),
              ),
            );
          },
          title: item['title'],
          info: item['info'],
          image: Image(
            image: AssetImage(
                'assets/images/${item['category'].toString().toLowerCase()}.png'),
          ),
          price: item['price'],
          ratings: item['rating'],
          reviews: item['reviewers'],
        ),
      );
      _grid.add(
        GridViewItem(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  title: item['title'],
                  info: item['info'],
                  image: Image(
                    image: AssetImage(
                        'assets/images/${item['category'].toString().toLowerCase()}.png'),
                  ),
                  price: item['price'],
                  ratings: item['rating'],
                  reviews: item['reviewers'],
                ),
              ),
            );
          },
          title: item['title'],
          info: item['info'],
          image: Image(
            image: AssetImage(
                'assets/images/${item['category'].toString().toLowerCase()}.png'),
          ),
          price: item['price'],
          ratings: item['rating'],
          reviews: item['reviewers'],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          'Menu',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _logoutPopUp();
              },
              icon: Icon(
                Icons.logout,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                GestureDetector(
                  // Handel filters
                  onTap: () {
                    _filterPopUp();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        children: [
                          Text(
                            'Filters ',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 15),
                          ),
                          Icon(
                            Icons.filter_alt_sharp,
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isListView
              ? Divider(
                  height: 0,
                )
              : Container(),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: _isListView
                  ? ListView.separated(
                      separatorBuilder: (context, sepIndex) {
                        return Divider(
                          height: 1,
                        );
                      },
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        return _list[index];
                      },
                    )
                  : GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.8),
                      children: _grid,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _logoutPopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Are you sure that you want to log out?',
                      textScaleFactor: 1.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundedButton(
                            borderColor: Theme.of(context).primaryColor,
                            width: 90,
                            height: 40,
                            backroundColor: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColor,
                            text: 'No',
                            onClick: () {
                              Navigator.of(context).pop();
                            }),
                        RoundedButton(
                            width: 90,
                            height: 40,
                            backroundColor: Theme.of(context).primaryColor,
                            textColor: Theme.of(context).accentColor,
                            text: 'Yes',
                            onClick: () {
                              _authServices.logOut().whenComplete(() =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => AuthPage()),
                                      (route) => false));
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _filterPopUp() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Filters',
                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButton(
                    items: [],
                    hint: Text('Diet'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundedButton(
                        borderColor: Theme.of(context).primaryColor,
                        width: 90,
                        height: 40,
                        backroundColor: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColor,
                        text: 'Back',
                        onClick: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      RoundedButton(
                        width: 90,
                        height: 40,
                        backroundColor: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).accentColor,
                        text: 'Apply',
                        onClick: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
