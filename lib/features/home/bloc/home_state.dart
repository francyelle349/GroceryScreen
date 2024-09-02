// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState{}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {

  List<ProductDataModel> products;


  HomeLoadedSuccessState({
    required this.products,
  });

}

class HomeErrorState extends HomeState{}

class homeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeProductItemWishListWhenIsInsideTheWishlistActionState extends HomeActionState{}

class HomeProductItemCartWhenIsInsideTheCartActionState extends HomeActionState{}
