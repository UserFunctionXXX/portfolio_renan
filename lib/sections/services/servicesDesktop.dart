import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_renan/animations/bottomAnimation.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';
import 'package:portfolio_renan/sections/services/widget/serviceCardBackWidget.dart';
import 'package:portfolio_renan/widget/customTextHeading.dart';
import 'package:portfolio_renan/widget/serviceCard.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:provider/provider.dart';

class ServiceDesktop extends StatefulWidget {
  @override
  _ServiceDesktopState createState() => _ServiceDesktopState();
}

class _ServiceDesktopState extends State<ServiceDesktop> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nExperiências"),
          CustomSectionSubHeading(
              text: "Veja abaixo minhas principais stacks de atuação \n\n"),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: WidgetAnimator(
                      child: ServiceCard(
                        cardWidth: width < 1200 ? width * 0.25 : width * 0.22,
                        cardHeight:
                            width < 1200 ? height * 0.37 : height * 0.35,
                        serviceIcon: kExperiencesIcons[index],
                        serviceTitle: kExperiencesTitles[index],
                        serviceDescription: kExperiencesDescriptions[index],
                        serviceLink: kExperiencesLinks[index],
                        cardBack: ServiceCardBackWidget(
                            serviceTitle: kExperiencesTitles[index],
                            serviceDesc: kExperiencesDescriptions[index],
                            serviceLink: kExperiencesLinks[index],
                            themeProvider: _themeProvider,
                            height: height,
                            width: width),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int index = 3; index < kExperiencesIcons.length; index++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: WidgetAnimator(
                        child: ServiceCard(
                          cardWidth: width < 1200 ? width * 0.25 : width * 0.22,
                          cardHeight:
                              width < 1200 ? height * 0.37 : height * 0.35,
                          serviceIcon: _themeProvider.lightTheme && index == 4
                              ? "assets/services/open_b.png"
                              : kExperiencesIcons[index],
                          serviceTitle: kExperiencesTitles[index],
                          serviceDescription: kExperiencesDescriptions[index],
                          serviceLink: kExperiencesLinks[index],
                          cardBack: ServiceCardBackWidget(
                            serviceDesc: kExperiencesDescriptions[index],
                            serviceTitle: kExperiencesTitles[index],
                            serviceLink: kExperiencesLinks[index],
                            themeProvider: _themeProvider,
                            height: height,
                            width: width,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

