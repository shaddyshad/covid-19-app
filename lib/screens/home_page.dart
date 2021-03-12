import 'package:covid_19/constants.dart';
import 'package:covid_19/screens/details_screen.dart';
import 'package:covid_19/widgets/info_card.dart';
import 'package:covid_19/widgets/prevention_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                )
            ),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: <Widget>[
                InfoCard(
                  title: "Confirmed Cases",
                  iconColor: Color(0xFFFF8C00),
                  affectedNum: 1062,
                  pressed: () {},
                ),
                InfoCard(
                  title: "Total Deaths",
                  iconColor: Color(0xFFFF2D55),
                  affectedNum: 75,
                  pressed: () {},
                ),
                InfoCard(
                  title: "Total Recovered",
                  iconColor: Color(0xFF50E3C2),
                  affectedNum: 689,
                  pressed: () {},
                ),
                InfoCard(
                  title: "New Cases",
                  iconColor: Color(0xFF5856D6),
                  affectedNum: 52,
                  pressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return DetailsScreen();
                        }
                        )
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Preventions", style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  buildPreventation(),
                  SizedBox(height: 40,),
                  buildHelpCard(context)
                ],
              ),
            )
          )
        ],
      )
    );
  }

  Row buildPreventation(){
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PreventionCard(
              svgSrc: "assets/icons/hand_wash.svg",
              title: "Wash Hands",
            ),
            PreventionCard(
              svgSrc: "assets/icons/use_mask.svg",
              title: "Use Mask",
            ),
            PreventionCard(
              svgSrc: "assets/icons/Clean_Disinfect.svg",
              title: "Clean Disinfect",
            )
          ],
    );
  }

  AppBar buildAppBar() {
    return (
        AppBar(
          backgroundColor: kPrimaryColor.withOpacity(.03),
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/menu.svg'),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              onPressed: () {},
            )
          ],
        )
    );
  }

  Container buildHelpCard(BuildContext context){
    return Container(
          height: 150,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .4,
                    top: 20,
                    right: 20
                ),
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF60BE93),
                        Color(0xFF1B8D59)
                      ]
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Dial 999 for \n Medical help \n",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white)
                        ),
                        TextSpan(
                            text: "If any symptoms appear",
                            style: TextStyle(color: Colors.white.withOpacity(0.7))
                        )
                      ]
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SvgPicture.asset("assets/icons/nurse.svg"),
              ),
              Positioned(
                child: SvgPicture.asset("assets/icons/virus.svg"),
                top: 30,
                right: 10,
              )
            ],
          ),
    );
  }


}

