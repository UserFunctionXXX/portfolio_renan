import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_renan/animations/entranceFader.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';
import 'package:portfolio_renan/sections/appbar/appBarActions.dart';
import 'package:portfolio_renan/sections/navBar/navBarLogo.dart';
import 'package:universal_html/html.dart' as html;

class AppBarTabDesktop extends StatefulWidget implements PreferredSizeWidget {
  final ThemeProvider themeProviders;
  final ScrollController scrollController;

  const AppBarTabDesktop({Key key, this.themeProviders, this.scrollController}) : super(key: key);
  @override
  _AppBarTabDesktopState createState() => _AppBarTabDesktopState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(75);
}

class _AppBarTabDesktopState extends State<AppBarTabDesktop> {
  final List<String> _sectionsName = [
    "HOME",
    "SOBRE",
    "SERVIÇOS",
    "EXPERIÊNCIA",
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
  @override
  Widget build(BuildContext context) {
    List<Widget> listActions = _listActions(widget.themeProviders);
    return AppBar(
      elevation: 0.0,
      backgroundColor:
          widget.themeProviders.lightTheme ? Colors.white : Colors.black,
      title: MediaQuery.of(context).size.width < 780
          ? EntranceFader(
              duration: Duration(milliseconds: 250),
              offset: Offset(0, -10),
              delay: Duration(seconds: 3),
              child: NavBarLogo(
                height: 20.0,
              ))
          : EntranceFader(
              offset: Offset(0, -10),
              duration: Duration(milliseconds: 250),
              delay: Duration(milliseconds: 100),
              child: NavBarLogo(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
            ),
      actions: listActions,
    );
  }

  List<Widget> _listActions(ThemeProvider themeProv) {
    List<Widget> list = [];
    for (int i = 0; i < _sectionsName.length; i++) {
      list.add(AppBarActions(
          childText: _sectionsName[i],
          index: i,
          icon: _sectionsIcons[i],
          themeProvider: themeProv,
          scrollController: widget.scrollController));
    }

    list.add(EntranceFader(
      offset: Offset(0, -10),
      delay: Duration(milliseconds: 100),
      duration: Duration(milliseconds: 250),
      child: Container(
        height: 60.0,
        width: 120.0,
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          hoverColor: kPrimaryColor.withAlpha(150),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: kPrimaryColor)),
          onPressed: () {
            html.window.open(
                'https://drive.google.com/file/d/1kvBgzeKIVNyhv14_DX2396S1l5VeTITr/view?usp=sharing',
                "pdf");
          },
          child: Text(
            "CV",
            style: GoogleFonts.montserrat(
              color: themeProv.lightTheme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    ));
    list.add(const SizedBox(width: 15.0));
    list.add(SizedBox(
      height: 30.0,
      child: Switch(
        inactiveTrackColor: Colors.grey,
        value: !themeProv.lightTheme,
        onChanged: (value) {
          themeProv.lightTheme = !value;
        },
        activeColor: kPrimaryColor,
      ),
    ));
    list.add(const SizedBox(width: 15.0));

    return list;
  }
}
