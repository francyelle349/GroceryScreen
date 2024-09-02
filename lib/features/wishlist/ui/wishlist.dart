import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_application_1/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class wishListPage extends StatefulWidget {
  const wishListPage({super.key});

  @override
  State<wishListPage> createState() => _wishListPageState();
}

class _wishListPageState extends State<wishListPage> {
  final WishlistBloc wishListBloc = WishlistBloc();

  @override
  void initState() {
    wishListBloc.add(wishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List Items'),
      ),

      body: BlocConsumer(
        bloc: wishListBloc,
        listenWhen: (previous,current) => current is wishlistActionState,
        buildWhen: (previous, current) => current is !wishlistActionState,
        listener: (context,state){},
        builder: (context,state){
          switch(state.runtimeType){
            case wishlistSuccessState:
              final successState = state as wishlistSuccessState;

              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index){
                return WishlistTileWidget(productDataModel: successState.wishlistItems[index], wishlistBloc: wishListBloc);
              });
            default: 
            return SizedBox();
          }
        }, 
         )
    );
  }
}
