// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class wishlistActionState extends WishlistState{}

final class WishlistInitial extends WishlistState {}

class wishlistSuccessState extends WishlistState {
  final List<ProductDataModel> wishlistItems;
  
  wishlistSuccessState({
    required this.wishlistItems,
  });
  
}
