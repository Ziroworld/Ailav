part of 'delivery_charge_cubit.dart';

sealed class DeliveryChargeState extends Equatable {
  const DeliveryChargeState();

  @override
  List<Object> get props => [];
}

final class DeliveryChargeInitial extends DeliveryChargeState {}
