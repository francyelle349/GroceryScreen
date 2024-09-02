import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/cart/ui/cart.dart';
import 'package:flutter_application_1/features/home/bloc/home_bloc.dart';
import 'package:flutter_application_1/features/home/ui/product_title_widget.dart';
import 'package:flutter_application_1/features/wishlist/ui/wishlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => cartPage()));
        } else if (state is homeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => wishListPage()));
        }
        else if(state is HomeProductItemWishListWhenIsInsideTheWishlistActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('item wish listed')));
        }
        else if(state is HomeProductItemCartWhenIsInsideTheCartActionState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("carted")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator(), ));

          case HomeLoadedSuccessState:
          final sucessState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.cyanAccent,
                title: Text('Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite,  color: Colors.pink,)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.shopping_cart,  color: Colors.black,))
                ],
              ),
              body: ListView.builder(itemCount:sucessState.products.length, itemBuilder: (context,index){
                return ProductTileWidget(productDataModel: sucessState.products[index],homeBloc: homeBloc,);

              }),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text("error")));
          default: 
          return SizedBox();
        }
        

      },
    );
  }
}
