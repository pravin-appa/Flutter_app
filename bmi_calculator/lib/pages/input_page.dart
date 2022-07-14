import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/RoundIcon_Button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
  noGender,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.noGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  //
  // void updateColor(Gender selectedGender){
  //   //male card pressed
  //   if(selectedGender==Gender.male){
  //     if(maleCardColor==inactiveCardColor){
  //       maleCardColor = cardColor;
  //       femaleCardColor=inactiveCardColor;
  //     }else{
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   //female card pressed
  //   if(selectedGender==Gender.female){
  //     if(femaleCardColor==inactiveCardColor){
  //       femaleCardColor = cardColor;
  //       maleCardColor = inactiveCardColor;
  //     }else{
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      // updateColor(Gender.male);
                      selectedGender = Gender.male;
                    },
                    colour: selectedGender == Gender.male
                        ? kCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      // updateColor(Gender.male);
                      selectedGender = Gender.female;
                    },
                    colour: selectedGender == Gender.female
                        ? kCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kIconTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kLabelTextStyle),
                      const Text(
                        'cm',
                        style: kIconTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF888995),
                        thumbColor: const Color(0xFFEA1556),
                        overlayColor: const Color(0x49EA1556),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25.0)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 240.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kIconTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(() {
                                weight--;
                              }),
                            ),
                            const SizedBox(
                              width: 10.0,
                              height: 56.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(() {
                                weight++;
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kCardColor,
                    cardChild: Column(
                      children: [
                        const Text(
                          'AGE',
                          style: kIconTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(() {
                                age--;
                              }),
                            ),
                            const SizedBox(
                              width: 10.0,
                              height: 56.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(() {
                                age++;
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonTitle: ' CALCULATE',
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(resultText: calc.getResult(), bmiResult: calc.bmiCalculate(), advice:calc.getAdvice(),)));
              }
                ),
        ],
      ),
    );
  }
}
