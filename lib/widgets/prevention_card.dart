import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19/constants.dart';

class PreventionCard extends StatelessWidget{
  final String svgSrc;
  final String title;

  PreventionCard({Key key, this.svgSrc, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
        Column(
          children: [
            SvgPicture.asset(svgSrc),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: kPrimaryColor),
            )
          ],
        )
    );
  }
}