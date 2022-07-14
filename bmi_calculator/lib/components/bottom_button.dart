import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>onTap(),
      child: Container(
        color: kBottomButtonColor,
        height: kBottomButtonHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}
