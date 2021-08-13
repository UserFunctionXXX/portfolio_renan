import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';
import 'package:portfolio_renan/sections/appbar/appBarActions.dart';
import 'package:portfolio_renan/sections/appbar/appBarMobile.dart';
import 'package:portfolio_renan/sections/appbar/appBarTabDesktop.dart';
import 'package:portfolio_renan/sections/portfolio/portfolio.dart';
import 'package:portfolio_renan/widget/sectionsBody.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_renan/animations/entranceFader.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:portfolio_renan/sections/about/about.dart';
import 'package:portfolio_renan/sections/contact/contact.dart';
import 'package:portfolio_renan/sections/home/home.dart';
import 'package:portfolio_renan/sections/navBar/navBarLogo.dart';
import 'package:portfolio_renan/sections/services/services.dart';
import 'package:portfolio_renan/widget/arrowOnTop.dart';
import 'package:portfolio_renan/sections/footer/footer.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ThemeProvider _themeProviders = ThemeProvider();
  bool isPressed = false;
  bool _isScrollingDown = false;
  ScrollController _scrollController = ScrollController();

  final List<String> _sectionsName = [
    "HOME",
    "SOBRE",
    "SERVIÇOS",
    "PORTFÓLIO",
    "CONTATO"
  ];

  final List<IconData> _sectionsIcons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.build,
    Icons.article,
    Icons.phone,
  ];

  void _scroll(int i) {
    _scrollController.animateTo(
      i == 0
          ? 0.0
          : i == 1
              ? MediaQuery.of(context).size.height * 1.05
              : i == 2
                  ? MediaQuery.of(context).size.height * 1.98
                  : i == 3
                      ? MediaQuery.of(context).size.height * 2.9
                      : MediaQuery.of(context).size.height * 4,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return About();
    } else if (i == 2) {
      return Services();
    } else if (i == 3) {
      return Portfolio();
    } else if (i == 4) {
      return Contact();
    } else if (i == 5) {
      return Footer();
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    _scrollController = _themeProviders.scroll;
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          setState(() {});
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: _themeProv.lightTheme ? Colors.white : Colors.black,
      appBar: MediaQuery.of(context).size.width < 760
          ? AppBar(
              iconTheme: IconThemeData(
                  color: _themeProv.lightTheme ? Colors.black : Colors.white),
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                NavBarLogo(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                )
              ],
            )
          : AppBarTabDesktop(
              themeProviders: _themeProv,
              scrollController: _scrollController,
            ),
      drawer: MediaQuery.of(context).size.width < 760
          ? AppBarMobile(
              themeProviders: _themeProv,
              scrollController: _scrollController,
            )
          : null,
      body: Stack(
        children: [
          SectionsBody(
            scrollController: _scrollController,
            sectionsLength: _sectionsIcons.length,
            sectionWidget: sectionWidget,
          ),
          _isScrollingDown
              ? Positioned(
                  bottom: 90,
                  right: 0,
                  child: EntranceFader(
                    offset: Offset(0, 20),
                    child: ArrowOnTop(
                      onPressed: () => _scroll(0),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
