import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';
import 'package:portfolio_renan/sections/appbar/appBarActions.dart';
import 'package:portfolio_renan/sections/navBar/navBarLogo.dart';

class AppBarMobile extends StatefulWidget {
  final ThemeProvider themeProviders;
  final ScrollController scrollController;

  const AppBarMobile({Key key, this.themeProviders, this.scrollController}) : super(key: key);
  @override
  _AppBarMobileState createState() => _AppBarMobileState();
}

class _AppBarMobileState extends State<AppBarMobile> {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: widget.themeProviders.lightTheme ? Colors.white : Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: NavBarLogo(
                  height: 28,
                ),
              ),
              Divider(
                color: widget.themeProviders.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: kPrimaryColor,
                ),
                title: Text("Dark Mode",
                    style: TextStyle(
                        color: widget.themeProviders.lightTheme ? Colors.black : Colors.white)),
                trailing: Switch(
                  inactiveTrackColor: Colors.grey,
                  value: !widget.themeProviders.lightTheme,
                  onChanged: (value) {
                    widget.themeProviders.lightTheme = !value;
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Divider(
                color: widget.themeProviders.lightTheme ? Colors.grey[200] : Colors.white,
              ),
              for (int i = 0; i < _sectionsName.length; i++)
                AppBarActions(childText: _sectionsName[i], index: i, icon: _sectionsIcons[i], themeProvider: widget.themeProviders,scrollController: widget.scrollController,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: kPrimaryColor.withAlpha(150),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: kPrimaryColor)),
                  onPressed: () {
                    launchURL(
                        "https://drive.google.com/file/d/1kvBgzeKIVNyhv14_DX2396S1l5VeTITr/view?usp=sharing");
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.book,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      "CV",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: widget.themeProviders.lightTheme ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
