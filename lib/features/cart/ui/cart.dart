import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_application_1/features/cart/ui/cart_title_widget.dart';
import 'package:flutter_application_1/features/home/ui/product_title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
   cartBloc.add(CartInitialEvent());
   super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cart Items")),
        
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          listenWhen: (previous, current) => current is CartActionState,
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
             case cartSucessState: 
                final successState = state as cartSucessState;
                return ListView.builder(
                    itemCount: successState.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartTileWidget(
                          productDataModel: successState.cartItems[index],
                          cartBloc: cartBloc);
                    },
                   
                    );
             default:
             return SizedBox();
          
              
 }
          },
        ));
  }
}
