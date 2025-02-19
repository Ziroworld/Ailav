part of 'my_information_bloc.dart';

sealed class MyInformationState extends Equatable {
  const MyInformationState();
  
  @override
  List<Object> get props => [];
}

final class MyInformationInitial extends MyInformationState {}
