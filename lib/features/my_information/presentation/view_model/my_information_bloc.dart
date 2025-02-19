import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_information_event.dart';
part 'my_information_state.dart';

class MyInformationBloc extends Bloc<MyInformationEvent, MyInformationState> {
  MyInformationBloc() : super(MyInformationInitial()) {
    on<MyInformationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
