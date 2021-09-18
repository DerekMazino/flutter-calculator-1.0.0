part of 'calculator_bloc.dart';

class CalculatorState {
  final String mathResoult;
  final String firtsNumber;
  final String seconNumber;
  final String operation;

  CalculatorState(
      {this.mathResoult = '30',
      this.firtsNumber = '10',
      this.seconNumber = '20',
      this.operation = '+'});

  CalculatorState copyWith({
    String? mathResoult,
    String? firtsNumber,
    String? seconNumber,
    String? operation,
  }) =>
      CalculatorState(
        mathResoult: mathResoult ?? this.mathResoult,
        firtsNumber: firtsNumber ?? this.firtsNumber,
        seconNumber: seconNumber ?? this.seconNumber,
        operation: operation ?? this.operation,
      );
}
