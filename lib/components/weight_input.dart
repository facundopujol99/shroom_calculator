import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shroom_calculator/constants/constants.dart';

class WeightInput extends StatefulWidget {
  const WeightInput({super.key, required this.onPressedParent});
  final Function(CalcSteps, {String option}) onPressedParent;

  @override
  _WeightInputState createState() => _WeightInputState();
}

class _WeightInputState extends State<WeightInput> {
  final TextEditingController _weightController = TextEditingController();
  late Widget content;

  void weightUnitSelected(String unit) {
    setState(() {
      content = _buildNumberInput(unit);
    });
  }

  @override
  void initState() {
    super.initState();
    content = _buildNumberInput("");
  }

  Widget _buildNumberInput(String unit) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              labelText: 'Enter your weight in $unit',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightUnitButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: TextButton(
            onPressed: () {
              weightUnitSelected('kg');
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
              weightUnitSelected('lg');
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 16),
      child: SizedBox(
        width: screenHeight / 4,
        height: screenHeight / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
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
                labelText: 'Ingresa tu peso',
                labelStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(),
                filled: true,
                suffixText: "KG",
                contentPadding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 0, 1),
                    size: 30,
                    shadows: [
                      BoxShadow(
                        color: const Color.fromARGB(200, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 0, 0, 1),
                    size: 30,
                    shadows: [
                      BoxShadow(
                        color: const Color.fromARGB(200, 0, 0, 0),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
