import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kNumberTextStyle.copyWith(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: kBottomContainerColor,
        ),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}
