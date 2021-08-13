import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_renan/constants.dart';
import 'package:portfolio_renan/provider/themeProvider.dart';
import 'package:portfolio_renan/sections/services/servicesDesktop.dart';
import 'package:portfolio_renan/sections/services/widget/serviceCardBackWidget.dart';
import 'package:portfolio_renan/widget/customTextHeading.dart';
import 'package:portfolio_renan/widget/serviceCard.dart';
import 'package:provider/provider.dart';

class ServiceMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          CustomSectionHeading(text: "\nExperiências"),
          CustomSectionSubHeading(
              text: "Veja abaixo minhas principais stacks de atuação \n\n"),
          CarouselSlider.builder(
            itemCount: kExperiencesTitles.length,
            itemBuilder: (BuildContext context, int itemIndex, int i) =>
                Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ServiceCard(
                cardWidth: width < 650 ? width * 0.8 : width * 0.5,
                serviceIcon: kExperiencesIcons[i],
                serviceTitle: kExperiencesTitles[i],
                serviceDescription: kExperiencesDescriptions[i],
                serviceLink: kExperiencesLinks[i],
                cardBack: ServiceCardBackWidget(
                  serviceTitle: kExperiencesTitles[i],
                  serviceDesc: kExperiencesDescriptions[i],
                  serviceLink: kExperiencesLinks[i],
                  themeProvider: _themeProvider,
                  height: height,
                  width: width,
                ),
              ),
            ),
            options: CarouselOptions(
                height: width < 450 ? height * 0.4 : height * 0.4,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                enableInfiniteScroll: false),
          )
        ],
      ),
    );
  }
}
