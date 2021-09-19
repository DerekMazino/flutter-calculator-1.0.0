import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    //Borrar todo
    if (event is ResetAC) {
      yield* this._resetAC();
      //Agregar un numero
    } else if (event is AddNumber) {
      yield state.copyWith(
        mathResoult: (state.mathResoult == '0')
            ? event.number
            : state.mathResoult + event.number,
      );
    } else if (event is ChangeNegativePositive) {
      yield state.copyWith(
          mathResoult: (state.mathResoult.contains('-'))
              ? state.mathResoult.replaceFirst('-', '')
              : '-' + state.mathResoult);
      //Borrar ultimo digito
    } else if (event is DeleteLastEntry) {
      yield state.copyWith(
          mathResoult: state.mathResoult.length > 1
              ? state.mathResoult.substring(0, state.mathResoult.length - 1)
              : '0');
    } else if (event is OperationEntry) {
      yield state.copyWith(
          firtsNumber: state.mathResoult,
          mathResoult: '0',
          operation: event.operation,
          seconNumber: '0');
    } else if (event is CalculateResult) {
      yield* _calculateResoult();
    }
  }

  Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState(
        firtsNumber: '0', seconNumber: '0', mathResoult: '0', operation: '+');
  }

  Stream<CalculatorState> _calculateResoult() async* {
    final double num1 = double.parse(state.firtsNumber);
    final double num2 = double.parse(state.mathResoult);
    switch (state.operation) {
      case '+':
        yield state.copyWith(
          seconNumber: state.mathResoult,
          mathResoult: '${num1 + num2}',
        );
        break;
      case '-':
        yield state.copyWith(
          seconNumber: state.mathResoult,
          mathResoult: '${num1 - num2}',
        );
        break;
      case 'X':
        yield state.copyWith(
          seconNumber: state.mathResoult,
          mathResoult: '${num1 * num2}',
        );
        break;
      case '/':
        yield state.copyWith(
          seconNumber: state.mathResoult,
          mathResoult: '${num1 / num2}',
        );
        break;
      default:
        yield state;
        break;
    }

  }
}
