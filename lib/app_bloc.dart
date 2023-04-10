import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_learning/app_events.dart';
import 'package:u_learning/app_states.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  AppBloc() : super(InitState()) {
    on<IncrementEvent>((event, emit) {
      emit(
        AppStates(
          counter: state.counter + 1,
        ),
      );
    });

    on<DecrementEvent>(
      (event, emit) => emit(
        AppStates(
          counter: state.counter - 1,
        ),
      ),
    );
  }
}
