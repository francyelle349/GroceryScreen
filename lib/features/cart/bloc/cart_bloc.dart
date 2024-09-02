import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/cart_items.dart';
import 'package:flutter_application_1/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
  on<CartInitialEvent>(cartInitialEvent);
  on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(cartSucessState(cartItems: cart_Items));
  }

  FutureOr<void> cartRemoveFromCartEvent(CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cart_Items.remove(event.productDataModel);
    emit(cartSucessState(cartItems: cart_Items));
    
  }
}
