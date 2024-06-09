import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_events.dart';
part 'app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }
}
