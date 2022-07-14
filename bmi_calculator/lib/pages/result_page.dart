import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult, required this.resultText, required this.advice});


  final String bmiResult;
  final String resultText;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kResultTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
                colour: kCardColor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(),style: kResultTextStyle,),
                    Text(
                      bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      advice,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
                onPress: (){
                }),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
            onTap: ()=> Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
