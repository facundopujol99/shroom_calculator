import 'package:flutter/material.dart';
import 'package:shroom_calculator/components/app_text.dart';
import 'package:shroom_calculator/screens/home_screen.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color.fromARGB(199, 0, 0, 0)),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        iconSize: 40,
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: Stack(
        children: [
          Container(
            width: screen.width,
            height: screen.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 1, child: AppText(text: "Información")),
                Expanded(
                  flex: 2,
                  child: AppText(
                    fontsize: 16,
                    text:
                        "ESTA CALCULADORA SE UTILIZA PARA\nCALCULAR DOSIS MEDIAS.\nHAY PERSONAS MAS SENSIBLES\nA LAS SUSTANCIAS ACTIVAS QUE OTRAS.\nLOS CALCULOS SON ESTIMACIONES\nY NO SE DEBERIAN TOMAR COMO\nPAUTAS EXACTAS.",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppText(
                    fontsize: 18,
                    text:
                        "POR MÁS INFORMACIÓN\nINVITAMOS A NUESTRO\nLABORATORIO MICOLÓGICO\nVIRTUAL:",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppText(fontsize: 20, text: "WWW.PSILOSOFIA.UY"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
