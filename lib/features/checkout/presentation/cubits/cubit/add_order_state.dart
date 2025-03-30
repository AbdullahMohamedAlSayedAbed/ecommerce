part of 'add_order_cubit.dart';

sealed class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

final class AddOrderInitial extends AddOrderState {}

final class AddOrderLoading extends AddOrderState {}

final class AddOrderSuccess extends AddOrderState {
  // final OrderEntity orderEntity;

  // const AddOrderSuccess(this.orderEntity);

  // @override
  // List<Object> get props => [orderEntity];
}

final class AddOrderFailure extends AddOrderState {
  final String error;

  const AddOrderFailure(this.error);

  @override
  List<Object> get props => [error];
}
