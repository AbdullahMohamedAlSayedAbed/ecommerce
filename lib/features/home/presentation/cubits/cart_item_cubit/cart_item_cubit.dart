import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domin/entites/cart_item_entity.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void changeQuantity(CartItemEntity cartItemEntity) {
    emit(CartItemChanged(cartItemEntity: cartItemEntity));
  }
}
