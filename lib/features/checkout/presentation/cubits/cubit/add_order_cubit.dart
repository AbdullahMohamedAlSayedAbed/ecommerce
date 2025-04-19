import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:ecommerce/features/checkout/domin/entites/order_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;
  Future<void> addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrders(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(failure.message)),
      (order) => emit(AddOrderSuccess()),
    );
  }
}
