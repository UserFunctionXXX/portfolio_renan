import 'package:flutter/material.dart';
import 'package:portfolio_renan/animations/entranceFader.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';

class AppBarActions extends StatefulWidget {
  final String childText;
  final int index;
  final IconData icon;
  final ThemeProvider themeProvider;
  final ScrollController scrollController;
  const AppBarActions({
    Key key,
    @required this.childText,
    @required this.index,
    @required this.icon,
    @required this.themeProvider,
    @required this.scrollController,
  }) : super(key: key);

  @override
  _AppBarActionsState createState() => _AppBarActionsState();
}

class _AppBarActionsState extends State<AppBarActions> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 760
        ? EntranceFader(
            offset: Offset(0, -10),
            delay: Duration(milliseconds: 100),
            duration: Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 60.0,
              child: MaterialButton(
                hoverColor: kPrimaryColor,
                onPressed: () => _scroll(widget.index,widget.scrollController),
                child: Text(
                  widget.childText,
                  style: TextStyle(
                    color: widget.themeProvider.lightTheme
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              hoverColor: kPrimaryColor.withAlpha(70),
              onPressed: () {
                _scroll(widget.index,widget.scrollController);
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(
                  widget.icon,
                  color: kPrimaryColor,
                ),
                title: Text(widget.childText,
                    style: TextStyle(
                      color: widget.themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                    )),
              ),
            ),
          );
  }

  void _scroll(int i, ScrollController scrollController) {
    scrollController.animateTo(
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
}
