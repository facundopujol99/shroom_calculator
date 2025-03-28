import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shroom_calculator/constants/constants.dart';

class WeightPick extends StatefulWidget {
  const WeightPick({super.key, required this.onPressedParent});
  final Function(CalcSteps, {String option}) onPressedParent;

  @override
  _WeightPickState createState() => _WeightPickState();
}

class _WeightPickState extends State<WeightPick> {
  double? weight;

  void _showWeightDialog(String unit) {
    TextEditingController weightController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Ingrese tu peso"),
          content: TextField(
              controller: weightController,
              maxLength: 3,
              textAlign: TextAlign.end,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                wordSpacing: 20,
              ),
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(),
                filled: true,
                suffixText: unit,
                contentPadding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
              ),
            ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onPressedParent(
                  CalcSteps.weight,
                  option: "${weightController.text}-$unit",
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: TextButton(
              onPressed: () {
                _showWeightDialog('kg');
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/weight_kg.png'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: TextButton(
              onPressed: () {
                _showWeightDialog('lb');
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/weight_lb.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
