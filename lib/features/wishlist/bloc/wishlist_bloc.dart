import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/wishlist_items.dart';
import 'package:flutter_application_1/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
  on<wishlistInitialEvent>(wishInitialEvent);
  on<WishlistRemoveFromwishlistEvent>(wishlistRemoveFromwishlistEvent);
  }

  FutureOr<void> wishInitialEvent(wishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(wishlistSuccessState(wishlistItems: wishList_Items));
  }

  FutureOr<void> wishlistRemoveFromwishlistEvent(WishlistRemoveFromwishlistEvent event, Emitter<WishlistState> emit) {
    wishList_Items.remove(event.productDataModel);
    emit(wishlistSuccessState(wishlistItems: wishList_Items));

  }
}
