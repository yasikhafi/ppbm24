import 'package:demo/screens/core/constant/colors.dart';
import 'package:demo/screens/core/constant/sizes.dart';
import 'package:demo/screens/widget/calculator_screen.dart';
import 'package:demo/screens/widget/moneycv_screen.dart.dart';
import 'package:demo/screens/widget/tempcv_screen.dart';
import 'package:demo/screens/widget/vbl_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              isSelected: isDark,
              onPressed: () {
                setState(() {
                  isDark = !isDark;
                });
              },
              icon: const Icon(Icons.wb_sunny_outlined),
              selectedIcon: const Icon(Icons.brightness_2_outlined),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .45,
              decoration: const BoxDecoration(
                color: secondaryColor,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/quil.png',
                  ),
                  fit: BoxFit.none,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    sizedBox,
                    Text(
                      "Get Started!",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: textColorBlack, fontSize: 50),
                    ),
                    sizedBox,
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: textColorWhite,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: textColorBlack,
                            fontWeight: FontWeight.w300,
                          ),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search,
                            color: textColorBlack,
                          ),
                        ),
                      ),
                    ),
                    sizedBox,
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Calculator",
                            svgSrc: "assets/icons/calculator.svg",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, CalculatorScreen.routeName);
                            },
                          ),
                          CategoryCard(
                            title: "Money Converter",
                            svgSrc: "assets/icons/exchange.svg",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MoneyConverterScreen.routeName);
                            },
                          ),
                          CategoryCard(
                            title: "Temperature Converter",
                            svgSrc: "assets/icons/celsius.svg",
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  TemperatureConverterScreen.routeName);
                            },
                          ),
                          CategoryCard(
                            title: "Video Based Learning",
                            svgSrc: "assets/icons/video_library.svg",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, VideoBased.routeName);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String svgSrc;
  final VoidCallback onPressed;

  const CategoryCard({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -23,
              blurRadius: 17,
              offset: const Offset(0, 17),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  sizedBox,
                  SvgPicture.asset(svgSrc,
                      height:
                          100), // Replace with the path to your SVG icon (e.g., assets/)
                  sizedBox,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: textColorBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
