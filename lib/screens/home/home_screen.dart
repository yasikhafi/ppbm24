import 'package:demo/screens/core/constant/colors.dart';
import 'package:demo/screens/core/constant/sizes.dart';
import 'package:flutter/material.dart';
import 'package:demo/screens/widget/calculator_screen.dart';
import 'package:demo/screens/widget/convert_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Index 0: Home',
        style: optionStyle,
      ),
    ),
    SearchScreen(),
    Center(
      child: Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hi Yasikha'),
          centerTitle: true,
          leading: IconButton(
            isSelected: isDark,
            onPressed: () {
              setState(() {
                isDark = !isDark;
              });
            },
            icon: const Icon(Icons.wb_sunny_outlined),
            selectedIcon: const Icon(Icons.brightness_2_outlined),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: backgroundColor,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            _onItemTapped(index);
          },
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(kDefaultPadding), // Adjust the padding as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    // clear text field
                  },
                ),
              ),
            ),
          ),
          sizedBox,
          const Text(
            'Browse by Category',
            textAlign: TextAlign.end,
            style: TextStyle(
              color: textColorBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          sizedBox,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, CalculatorScreen.routeName);
            },
            child: Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                color: highlightColor,
              ),
              child: const Text(
                'Calculator',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          sizedBox,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ConvertScreen.routeName);
            },
            child: Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                color: supportingColor,
              ),
              child: const Text(
                'Convert',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          sizedBox,
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ConvertScreen.routeName);
            },
            child: Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding),
                color: secondaryColor,
              ),
              child: const Text(
                '###',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
