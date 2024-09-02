part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState{}

final class CartInitial extends CartState {}

class cartSucessState extends CartState {
  final List<ProductDataModel> cartItems;

  cartSucessState({required this.cartItems});
  
}