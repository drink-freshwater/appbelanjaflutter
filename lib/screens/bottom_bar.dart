import 'package:flutter/material.dart';
import 'cart.dart';
import 'feeds.dart';
import 'home.dart';
import 'search.dart';
import 'user_info.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List? _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      Home(),
      Feeds(),
      Search(),
      Cart(),
      UserInfo(),
    ];
    // _pages = [
    //   {'page': Home(), 'title': 'Home Screen'},
    //   {'page': Feeds(), 'title': 'Feeds Screen'},
    //   {'page': Search(), 'title': 'Search Screen'},
    //   {'page': Cart(), 'title': 'Cart Screen'},
    //   {'page': UserInfo(), 'title': 'User Info Screen'},
    // ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     _pages![_selectedPageIndex]['title'],
      //   ),
      //   centerTitle: true,
      // ),
      // body: _pages[_selectedPageIndex]['page'],
      body: _pages![_selectedPageIndex],
      bottomNavigationBar: BottomAppBar(
        // elevation: 5,
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                )),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.purple,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  tooltip: 'ini Home',
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed),
                  tooltip: 'Feeds',
                  label: 'Feeds',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  tooltip: 'Search',
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  tooltip: 'Cart',
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  tooltip: 'User',
                  label: 'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedPageIndex = 2;
          });
        },
        backgroundColor: Colors.purple,
        tooltip: 'Search',
        elevation: 5,
        child: (Icon(Icons.search)),
      ),
    );
  }
}
