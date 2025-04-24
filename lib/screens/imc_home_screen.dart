import 'package:flutter/material.dart';
import 'package:imc_calculator_app/components/gender_selector.dart';
import 'package:imc_calculator_app/components/height_selector.dart';
import 'package:imc_calculator_app/components/number_selector.dart';
import 'package:imc_calculator_app/core/app_colors.dart';
import 'package:imc_calculator_app/core/text_styles.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 25;
  int selectedWeight = 50;
  double selectedHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChange: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Peso".toUpperCase(),
                  value: selectedWeight,
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "Edad".toUpperCase(),
                  value: selectedAge,
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular".toUpperCase(), style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
