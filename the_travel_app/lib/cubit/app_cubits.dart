import 'package:bloc/bloc.dart';
import 'package:the_travel_app/cubit/app_cubit_state.dart';

class AppCubits extends Cubit<CubitState> {
  AppCubits() : super(InitialState()) {
    emit(WelcomState());
  }
}
