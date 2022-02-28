import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimension.dart';
import 'package:foodapp/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 1.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // RETURN A WIDGET TEXT IF THE TEXT IS LARGER THAN THE HEIGHT OF THE SCREEN
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
              children: <Widget>[
                SmallText(
                  height: 1.8,
                  text: hiddenText
                      ? (firstHalf + "...")
                      : (firstHalf + secondHalf),
                  color: AppColors.paraColor,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallText(
                          text: hiddenText ? "Show More" : "Show Less",
                          color: AppColors.mainColor,
                          size: Dimensions.font16,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
