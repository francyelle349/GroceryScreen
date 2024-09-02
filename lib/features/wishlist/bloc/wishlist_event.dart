// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class wishlistInitialEvent extends WishlistEvent{

}

class WishlistRemoveFromwishlistEvent extends WishlistEvent {
  ProductDataModel productDataModel;
  WishlistRemoveFromwishlistEvent({
    required this.productDataModel,
  });
}
