import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour:Color(0xFF101427) ,),
                ),
                Expanded(
                  child: ReusableCard(colour:Color(0xFF101427) ,),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour:Color(0xFF101427) ,),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour:Color(0xFF101427) ,),
                ),
                Expanded(
                  child: ReusableCard(colour:Color(0xFF101427) ,),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour});
  
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(15.0));
  }
}
