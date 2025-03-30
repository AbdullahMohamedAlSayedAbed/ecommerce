part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemChanged extends CartItemState {
  final CartItemEntity cartItemEntity;
  CartItemChanged({required this.cartItemEntity});
}
