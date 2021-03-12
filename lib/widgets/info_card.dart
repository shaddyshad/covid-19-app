import 'package:flutter/material.dart';
import 'package:covid_19/widgets/line_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_19/constants.dart';

class InfoCard extends StatelessWidget{
  final String title;
  final int affectedNum;
  final Color iconColor;
  final Function pressed;

  InfoCard({Key key, this.title, this.affectedNum, this.iconColor, this.pressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
        LayoutBuilder(
          builder: (context, constraints) {
            return GestureDetector(
              onTap: pressed,
              child: Container(
                width: constraints.maxWidth / 2 -10,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: iconColor.withOpacity(0.12),
                                shape: BoxShape.circle
                            ),
                            child: SvgPicture.asset("assets/icons/running.svg", height: 12, width: 12,),

                          ),
                          SizedBox(width: 5,),
                          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: kTextColor),
                                children: [
                                  TextSpan(
                                      text: "$affectedNum \n",
                                      style: TextStyle(fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(
                                      text: "People",
                                      style: TextStyle(
                                          fontSize: 12,
                                          height: 2
                                      )
                                  )
                                ]
                            ),
                          ),
                        ),
                        Expanded(child: LineReportChart())
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}