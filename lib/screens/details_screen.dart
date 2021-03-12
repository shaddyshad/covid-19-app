import 'package:covid_19/constants.dart';
import 'package:covid_19/widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,21),
                    blurRadius: 50,
                    color: Colors.black.withOpacity(0.05)
                  )
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleWithMore(),
                  SizedBox(height: 20,),
                  buildNewCases(context),
                  SizedBox(height: 20,),
                  Text(
                    "From Health Center",
                    style: TextStyle(fontWeight: FontWeight.w300, color: kTextMediumColor, fontSize: 16),
                  ),
                  SizedBox(height: 10,),
                  WeeklyChart(),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "6.43%",
                            style: Theme.of(context).textTheme.headline5.copyWith(color: kPrimaryColor),
                          ),
                          SizedBox(height: 10,),
                          Text("From Last Week", style: TextStyle(fontWeight: FontWeight.w300),)
                        ],
                      ),
                      Column(
                        children: [
                          Text("9.43%", style: Theme.of(context).textTheme.headline5.copyWith(color: kPrimaryColor),),
                          Text("Recovery Rate")
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  offset: Offset(0,21),
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 50
                )]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Global Map",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: kTextMediumColor
                        ),
                      ),
                      SvgPicture.asset("assets/icons/more.svg")
                    ],
                  ),
                  SizedBox(height: 20,),
                  SvgPicture.asset("assets/icons/map.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNewCases(BuildContext context){
    return Row(
      children: [
        Text(
          "52",
          style: Theme.of(context).textTheme.headline2.copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMore(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New Cases",
          style: TextStyle(
              color: kTextMediumColor,
              fontWeight: FontWeight.w600,
              fontSize: 15
          ),
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/more.svg"),
          onPressed: () {},
        )
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context){
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        color: kPrimaryColor,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {}
        )
      ],
    );
  }
}