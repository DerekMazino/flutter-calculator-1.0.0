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
    if(event is ResetAC){

      yield* this._resetAC();
    //Agregar un numero
    }else if(event is AddNumber){

      yield state.copyWith(
        mathResoult: (state.mathResoult == '0')
                      ? event.number
                      : state.mathResoult + event.number,
      );

    }else if(event is ChangeNegativePositive){

      yield state.copyWith(
        mathResoult: (state.mathResoult.contains('-'))
                    ? state.mathResoult.replaceFirst('-', '')
                    : '-' + state.mathResoult
      );

    }
  }

  Stream<CalculatorState> _resetAC() async*{
    yield CalculatorState(
        firtsNumber: '0',
        seconNumber: '0',
        mathResoult: '0',
        operation: ''
      );
  }
}
