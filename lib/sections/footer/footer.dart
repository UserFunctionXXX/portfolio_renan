import 'package:flutter/material.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';
import 'package:portfolio_renan/widget/adaptiveText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
      height: height * 0.07,
      width: width,
      color: _themeProvider.lightTheme ? Colors.white : Colors.grey[900],
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdaptiveText(
              "Desenvolvido com ",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w300,
                color: _themeProvider.lightTheme ? Colors.black : Colors.white,
              ),
            ),
            InkWell(
              onTap: () => launchURL("https://flutter.dev/"),
              child: Text(
                "Flutter",
                style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w300,
                color: kPrimaryColor,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
