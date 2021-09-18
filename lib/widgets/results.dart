import 'package:calculadora/bloc/calculator_bloc/calculator_bloc.dart';
import 'package:calculadora/widgets/line_separator.dart';
import 'package:calculadora/widgets/main_result.dart';
import 'package:calculadora/widgets/sub_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Column(
          children: [
            SubResult(text: state.firtsNumber),
            SubResult(text: state.operation),
            SubResult(text: state.seconNumber),
            LineSeparator(),
            MainResultText(text: state.mathResoult),
          ],
        );
      },
    );
  }
}
